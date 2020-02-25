class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.references :user, foreign_key: true
      t.references :flow, foreign_key: true
      t.references :task, foreign_key: true
      t.string :video
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
