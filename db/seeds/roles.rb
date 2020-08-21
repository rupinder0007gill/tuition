# frozen_string_literal: true

# This file contains app data for seeding purposes
# load Rails.root.join('db/seeds/*.rb') ; AppSeeds::ClassName.seed

module AppSeeds
  class Roles
    class << self
      def seed
        roles_attrs = [
          { name: 'admin' },
          { name: 'teacher' },
          { name: 'student' }
        ]

        roles_attrs.each do |role_attr|
          next unless Role.find_by(name: role_attr[:name]).nil?

          r = Role.new(role_attr)
          r.save!
        end
      end
    end
  end
end
