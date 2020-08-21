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
FactoryBot.define do
  factory :user do
    email { Faker::Name.unique.name }
    start_datetime { Faker::Date.between(from: '2020-08-21', to: '2020-08-25') }
    end_datetime { Faker::Date.between(from: '2020-09-21', to: '2020-09-25') }
    length_of_students { Faker::Number.decimal_part(digits: 2) }
    association :user, factory: :user
  end
end
