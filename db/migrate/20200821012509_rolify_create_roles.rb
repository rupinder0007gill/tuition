class RolifyCreateRoles < ActiveRecord::Migration[
    "#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}"
]
  def change
    create_table :roles, if_not_exists: true do |t|
      t.string :name
      t.references :resource, polymorphic: true

      ## Discard
      t.datetime :discarded_at, index: true

      t.timestamps
    end

    create_table :users_roles, id: false, if_not_exists: true do |t|
      t.references :user
      t.references :role
      ## Discard
      t.datetime :discarded_at, index: true
    end

    add_index :roles, %i[name resource_type resource_id]
    add_index :users_roles, %i[user_id role_id]
  end
end
