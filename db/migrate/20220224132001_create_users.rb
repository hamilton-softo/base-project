class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
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
