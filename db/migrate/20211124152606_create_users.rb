class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastName
      t.date :birthDate
      t.string :password
      t.boolean :active
      t.string :email

      t.timestamps
    end
  end
end
