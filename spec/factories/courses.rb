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
FactoryBot.define do
  factory :course do
    title { Faker::Name.unique.name }
    start_datetime { Faker::Date.between(from: '2020-08-21', to: '2020-08-25') }
    end_datetime { Faker::Date.between(from: '2020-09-21', to: '2020-09-25') }
    length_of_students { Faker::Number.decimal_part(digits: 2) }
    association :user, factory: :user
  end
end
