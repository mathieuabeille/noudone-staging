class CreateFlows < ActiveRecord::Migration[5.2]
  def change
    create_table :flows do |t|
      t.references :user, foreign_key: true
      t.string :status
      t.string :title
      t.text :description
      t.string :backgroundImage
      t.string :teaser

      t.timestamps
    end
  end
end
