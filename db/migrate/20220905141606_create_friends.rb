class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.references :sent_to, null: false, foreign_key: true
      t.references :sent_by, null: false, foreign_key: true

      t.timestamps
    end
  end
end
