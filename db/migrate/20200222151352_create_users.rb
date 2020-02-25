class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :nickName
      t.string :email
      t.string :password
      t.string :avatarUrl

      t.timestamps
    end
  end
end
