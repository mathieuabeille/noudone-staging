class AddOrderToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :order, :integer
  end
end
