# frozen_string_literal: true

# == Schema Information
#
# Table name: courses
#
#  id                 :bigint           not null, primary key
#  discarded_at       :datetime
#  end_datetime       :datetime         not null
#  length_of_students :bigint           not null
#  slug               :string           not null
#  start_datetime     :datetime         not null
#  state              :string           default("draft"), not null
#  title              :string           not null
#  uuid_token         :uuid             not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_courses_on_discarded_at  (discarded_at)
#  index_courses_on_slug          (slug) UNIQUE
#  index_courses_on_user_id       (user_id)
#  index_courses_on_uuid_token    (uuid_token) UNIQUE
#
class DateTimeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.public_send("#{attribute}_before_type_cast").present? && value.blank?
      record.errors.add(attribute, :invalid)
    end
  end
end

class Course < ApplicationRecord
  ##############################################################################
  ### Attributes ###############################################################
  extend FriendlyId
  friendly_id :title, use: :slugged

  ##############################################################################
  ### Constants ################################################################

  ##############################################################################
  ### Includes and Extensions ##################################################
  has_rich_text :content

  ##############################################################################
  ### Callbacks ################################################################

  ##############################################################################
  ### Associations #############################################################
  belongs_to :user

  ##############################################################################
  ### Validations ##############################################################
  validates :title, presence: true, uniqueness: { case_sensitive: false, scope: :user_id }
  validates :length_of_students, presence: true, numericality: { only_integer: true }
  validates :end_datetime, presence: true, date_time: true
  validates :start_datetime, presence: true, date_time: true

  ##############################################################################
  ### Scopes ###################################################################

  ##############################################################################
  ### Other ####################################################################

  ##############################################################################
  ### Class Methods ############################################################

  ##############################################################################
  ### Instance Methods #########################################################

  #########

  # protected

  #########

  #######

  # private

  #######
end
