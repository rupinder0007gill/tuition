# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  discarded_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  expired_at             :datetime
#  failed_attempts        :integer          default(0), not null
#  first_name             :string           default(""), not null
#  last_activity_at       :datetime
#  last_name              :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  locked_at              :datetime
#  password_changed_at    :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  secure_token           :uuid             not null
#  sign_in_count          :integer          default(0), not null
#  suspend_reason         :string           default(""), not null
#  suspended              :boolean          default(FALSE), not null
#  unconfirmed_email      :string
#  unlock_token           :string
#  username               :string           default(""), not null
#  uuid_token             :uuid             not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  unique_session_id      :string
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_discarded_at          (discarded_at)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_expired_at            (expired_at)
#  index_users_on_last_activity_at      (last_activity_at)
#  index_users_on_password_changed_at   (password_changed_at)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_secure_token          (secure_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#  index_users_on_uuid_token            (uuid_token) UNIQUE
#
class User < ApplicationRecord
  ##############################################################################
  ### Attributes ###############################################################
  attr_accessor :role

  ##############################################################################
  ### Constants ################################################################

  ##############################################################################
  ### Includes and Extensions ##################################################
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :password_expirable, :secure_validatable,
         :password_archivable, :session_limitable, :pwned_password
  ##############################################################################
  ### Callbacks ################################################################
  before_save :downcase_fields, :create_username
  after_create :assign_default_role
  ##############################################################################
  ### Associations #############################################################
  has_many :courses
  has_many :enrollments, dependent: :destroy
  has_many :enrolled_course, through: :enrollments, source: :user
  ##############################################################################
  ### Validations ##############################################################
  validates :email, uniqueness: true, presence: true,
                    'valid_email_2/email': { mx: true, disposable: true, disallow_subaddressing: true }
  validates :first_name, presence: true
  validates :username, uniqueness: { case_sensitive: false }

  ##############################################################################
  ### Scopes ###################################################################

  ##############################################################################
  ### Other ####################################################################
  rolify
  has_person_name
  has_one_attached :avatar

  ##############################################################################
  ### Class Methods ############################################################
  def to_param
    username
  end

  ##############################################################################
  ### Instance Methods #########################################################
  # discarded users to be unable to login and stop their session
  def active_for_authentication?
    super && !discarded? && !suspended
  end

  #########

  #########

  #######

  private

  def create_username
    self.username = find_unique_username(name.parameterize(separator: '_')) if username.blank?
  rescue StandardError
    errors.add(:username, 'cannot be created')
    throw :abort
  end

  def find_unique_username(username)
    taken_usernames =
      User.with_discarded.where('username LIKE ?', "#{username}%").pluck(
        :username
      )

    # username if it's free
    return username unless taken_usernames.include?(username)

    count = 2
    loop do
      # username_2, username_3...
      new_username = "#{username}_#{count}"
      return new_username unless taken_usernames.include?(new_username)

      count += 1
    end
  end

  def assign_default_role
    return add_role(role) if role.present?

    add_role(:student) if roles.blank?
  end

  def downcase_fields
    first_name.downcase!
    last_name.downcase!
    username.downcase!
  end

  #######
end
