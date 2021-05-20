# frozen_string_literal: true

class CreateSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :slots do |t|
      t.integer :user_id
      t.string :name
      t.integer :mana
      t.integer :happiens
      t.integer :fatigue
      t.integer :money

      t.timestamps
    end
  end
end
