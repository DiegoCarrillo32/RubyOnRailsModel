class AddDefaultValues < ActiveRecord::Migration[6.1]
  def change

    change_column_default :users, :active, true
    change_column_default :orders, :active, true

  end
end
