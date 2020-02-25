class AddTaskToChecklists < ActiveRecord::Migration[5.2]
  def change
    add_reference :checklists, :task, foreign_key: true
  end
end
