class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, uniqueness: true
  has_many :postvotes
  has_many :commentvotes
  has_many :posts
  has_many :comments
end
