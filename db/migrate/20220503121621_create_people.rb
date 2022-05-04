# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :cpf
      t.string :email
      t.string :address
      t.date :birthday
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
