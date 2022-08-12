class Item < ApplicationRecord
  belongs_to :users, :orders
end
