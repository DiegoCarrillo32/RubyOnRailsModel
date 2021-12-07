class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :orderNumber
      t.date :date
      t.decimal :total
      t.boolean :active
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
