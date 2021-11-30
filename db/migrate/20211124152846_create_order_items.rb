class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|

      t.decimal :total
      t.integer :quantity
      t.belongs_to :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
