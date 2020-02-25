class CreateForms < ActiveRecord::Migration[5.2]
  def change
    create_table :forms do |t|
      t.references :user, foreign_key: true
      t.references :flow, foreign_key: true
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
