class User < ApplicationRecord
  has_many :items, :orders
end