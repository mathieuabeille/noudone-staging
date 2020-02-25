class CreateInteractions < ActiveRecord::Migration[5.2]
  def change
    create_table :interactions do |t|
      t.references :user, foreign_key: true
      t.references :flow, foreign_key: true
      t.references :task, foreign_key: true
      t.references :batch, foreign_key: true
      t.string :interactionType

      t.timestamps
    end
  end
end
