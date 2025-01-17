# frozen_string_literal: true

# Migration to create posts
class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.boolean :published
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
