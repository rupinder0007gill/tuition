# frozen_string_literal: true

# This migration creates the `versions` table, the only schema PT requires.
# All other migrations PT provides are optional.
class CreateVersions < ActiveRecord::Migration[
    "#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}"
] # when serializing very large objects, `text` might not be big enough.
  TEXT_BYTES = 1_073_741_823

  def change
    create_table :versions, if_not_exists: true do |t|
      ## uuid token
      t.uuid :uuid_token,
             null: false, default: 'gen_random_uuid()'
      t.uuid :uuid_token_2, null: false, default: 'gen_random_uuid()'

      t.string :item_type, null: false
      t.integer :item_id, null: false, limit: 8
      t.string :event, null: false
      t.string :whodunnit
      t.text :object, limit: TEXT_BYTES
      t.text :object_changes, limit: TEXT_BYTES

      # Known issue in MySQL: fractional second precision
      # -------------------------------------------------
      #
      # MySQL timestamp columns do not support fractional seconds unless
      # defined with "fractional seconds precision". MySQL users should manually
      # add fractional seconds precision to this migration, specifically, to
      # the `created_at` column.
      # (https://dev.mysql.com/doc/refman/5.6/en/fractional-seconds.html)
      #
      # MySQL users should also upgrade to at least rails 4.2, which is the first
      # version of ActiveRecord with support for fractional seconds in MySQL.
      # (https://github.com/rails/rails/pull/14359)
      #
      t.datetime :created_at

      ## token index
      t.index :uuid_token, unique: true
      t.index :uuid_token_2, unique: true
    end
    add_index :versions, %i[item_type item_id]
  end
end
