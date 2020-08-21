class CreateEnrollments < ActiveRecord::Migration["#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}"]
  def change
    create_table :enrollments, if_not_exists: true do |t|
      ## uuid token
      t.uuid :uuid_token, null: false, default: 'gen_random_uuid()'

      ## fields
      t.string :state, default: 'draft', null: false

      ## reference
      t.references :user, null: false, foreign_key: true

      ## reference
      t.references :course, null: false, foreign_key: true

      ## token index
      t.index :uuid_token, unique: true

      ## Discard
      t.datetime :discarded_at, index: true

      ## timestamp
      t.timestamps
    end
  end
end
