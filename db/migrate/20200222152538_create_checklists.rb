class CreateChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :checklists do |t|
      t.references :user, foreign_key: true
      t.references :flow, foreign_key: true
      t.string :taskline
      t.boolean :answer

      t.timestamps
    end
  end
end
