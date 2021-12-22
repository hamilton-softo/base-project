class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :cpf, null: false
      t.string :email
      t.string :address
      t.date :birthday
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
