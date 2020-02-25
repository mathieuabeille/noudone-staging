class CreateBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :batches do |t|
      t.references :user, foreign_key: true
      t.references :flow, foreign_key: true
      t.integer :number

      t.timestamps
    end
  end
end
