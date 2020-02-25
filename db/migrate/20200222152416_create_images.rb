class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :user, foreign_key: true
      t.references :flow, foreign_key: true
      t.references :task, foreign_key: true
      t.string :image
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
