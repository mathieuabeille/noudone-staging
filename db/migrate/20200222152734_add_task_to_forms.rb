class AddTaskToForms < ActiveRecord::Migration[5.2]
  def change
    add_reference :forms, :task, foreign_key: true
  end
end
