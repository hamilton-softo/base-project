class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people, id: :uuid do |t|
      t.string :name
      t.string :cpf
      t.string :email
      t.string :address
      t.date :birthday
      t.boolean :active

      t.timestamps
    end
  end
end
