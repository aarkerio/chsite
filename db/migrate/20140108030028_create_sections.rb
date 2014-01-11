class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :description
      t.integer :order
      t.string :img

      t.timestamps
    end
  end
end
