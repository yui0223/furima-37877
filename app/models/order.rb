class Order < ApplicationRecord
  belongs_to :users, :items, :addresses
end