class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.string :link
      t.integer :point, default: 0
      t.timestamps null: false
    end
  end
end
