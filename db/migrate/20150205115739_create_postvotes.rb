class CreatePostvotes < ActiveRecord::Migration
  def change
    create_table :postvotes do |t|
      t.integer :like
      t.belongs_to :user, index: true
      t.belongs_to :post, index: true
    end
  end
end
