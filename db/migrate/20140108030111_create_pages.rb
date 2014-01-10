# Chipotle Software (c) 2013 GPLv3

class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.boolean :discution
      t.boolean :published
      t.integer :visits
      t.string :tags
      t.string :slug
      t.integer :rank
      t.boolean :cv
      t.boolean :editor
      t.references :user, index: true
      t.timestamp :created
      t.references :section, index: true

      t.timestamps
    end
  end
end
