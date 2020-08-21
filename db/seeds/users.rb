# frozen_string_literal: true

# This file contains app data for seeding purposes
# load Rails.root.join('db/seeds/*.rb') ; AppSeeds::ClassName.seed

module AppSeeds
  class Users
    class << self
      def seed
        users_attrs = [
          {
            first_name: 'Rupinder',
            last_name: 'Gill',
            email: 'rupinder0007gill@gmail.com',
            role: 'admin'
          },
          { 
            first_name: 'recker', 
            last_name: 'swartz', 
            email: 'reckerswartz@hotmail.com',
            role: 'teacher' 
          },
          { 
            first_name: 'aventum', 
            last_name: 'cormac', 
            email: 'aventumcormac@hotmail.com',
            role: 'student' 
          }
        ]

        users_attrs.each do |user_attr|
          next unless User.find_by(email: user_attr[:email]).nil?

          u = User.new(user_attr)
          u.password = 'teste12345'
          u.skip_confirmation!
          u.save(validate: false)
        end
      end
    end
  end
end
