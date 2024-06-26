# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.integer :white_id
      t.integer :white_rating, null: false
      t.integer :white_k
      t.integer :black_id
      t.integer :black_rating, null: false
      t.integer :black_k
      t.float :white_point, null: false
      t.date :start_at
      t.references :tournament, foreign_key: true
      t.string :time_type, null: false

      t.timestamps
    end
  end
end
