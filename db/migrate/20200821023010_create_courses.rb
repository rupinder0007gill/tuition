class CreateCourses < ActiveRecord::Migration["#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}"]
  def change
    create_table :courses, if_not_exists: true do |t|
      ## uuid token
      t.uuid :uuid_token, null: false, default: 'gen_random_uuid()'

      ## fields
      t.string :title, null: false
      t.datetime :start_datetime, null: false
      t.datetime :end_datetime, null: false
      t.bigint :length_of_students, null: false
      t.string :slug, null: false
      t.string :state, default: 'draft', null: false

      ## index
      t.index :slug, unique: true

      ## references
      t.references :user, null: false

      ## token index
      t.index :uuid_token, unique: true

      ## Discard
      t.datetime :discarded_at, index: true

      ## timestamp
      t.timestamps
    end
  end
end
