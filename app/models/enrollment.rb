# frozen_string_literal: true

class Enrollment < ApplicationRecord
  ##############################################################################
  ### Attributes ###############################################################

  ##############################################################################
  ### Constants ################################################################

  ##############################################################################
  ### Includes and Extensions ##################################################
  include AASM

  ##############################################################################
  ### Callbacks ################################################################

  ##############################################################################
  ### Associations #############################################################
  belongs_to :user
  belongs_to :course

  ##############################################################################
  ### Validations ##############################################################
  validate :enrollment_count_validation
  validates :course_id, uniqueness: { conditions: -> { kept }, scope: :user_id }

  def enrollment_count_validation
    errors.add(:states, "can't join more than 3 courses per month") if user.enrollments.where('created_at > ?', Date.current.beginning_of_month.beginning_of_day).count > 3
  end
  ##############################################################################
  ### Scopes ###################################################################

  ##############################################################################
  ### Other ####################################################################

  ##############################################################################
  ### Class Methods ############################################################
  aasm column: 'state', logger: Rails.logger do
    state :draft, initial: true
    state :approved
    state :rejected

    event :enrollment_approved, after_commit: :notify_approve do
      transitions from: %i[draft rejected], to: :approved
    end

    event :enrollment_rejected, after_commit: :notify_reject do
      transitions from: %i[draft approved], to: :rejected
    end
  end
  ##############################################################################
  ### Instance Methods #########################################################

  #########

  protected

  #########
  def notify_approve
    NotificationsMailer.enrollment_approve(self).deliver
  end

  def notify_reject
    NotificationsMailer.enrollment_reject(self).deliver
  end

  #######

  # private

  #######
end
