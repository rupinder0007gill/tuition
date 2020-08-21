# frozen_string_literal: true

class EnablePgcryptoExtension < ActiveRecord::Migration["#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}"]
  def change
    enable_extension 'pgcrypto' unless extensions.include?('pgcrypto')
  end
end
