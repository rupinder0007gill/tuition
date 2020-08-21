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
  end
end
