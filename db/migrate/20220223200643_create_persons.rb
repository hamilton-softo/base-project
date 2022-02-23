class CreatePersons < ActiveRecord::Migration[6.1]
  def change
    create_table :persons, id: :uuid do |t|
      t.string :name, null: false
      t.string :cpf, null: false, unique: true
      t.string :email, limit: 100, unique: true
      t.string :address
      t.date :birthday
      t.boolean :active, null: false, default: false
      t.timestamps
    end
  end
end
