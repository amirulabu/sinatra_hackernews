class CreateCommentvotes < ActiveRecord::Migration
  def change
    create_table :commentvotes do |t|
      t.integer :like
      t.belongs_to :user, index: true
      t.belongs_to :comment, index: true
    end
  end
end
