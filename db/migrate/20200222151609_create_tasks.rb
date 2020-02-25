class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :flow, foreign_key: true
      t.references :user, foreign_key: true
      t.string :status
      t.string :title
      t.text :description
      t.string :backgroundImage
      t.integer :time

      t.timestamps
    end
  end
end
