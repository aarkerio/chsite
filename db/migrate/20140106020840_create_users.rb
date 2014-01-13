# Chipotle Software (c) 2014 GPLv3

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :uname
      #  t.string :email  <--- devise
      t.string :password
      t.boolean :active
      t.references :group, index: true

      t.timestamps
    end
  end
end
