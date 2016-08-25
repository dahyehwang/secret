class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user2, index: true
      t.references :secret, index: true

      t.timestamps
    end
  end
end
