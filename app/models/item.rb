class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions 

  belongs_to :user
  has_one_attached :image

  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_date
  belongs_to :status

  with_options presence: true do
    
    validates :name
    validates :image
    validates :description
    validates :category_id,      numericality: { other_than: 1, message: "can't be blank" }
    validates :status_id,        numericality: { other_than: 1, message: "can't be blank"}
    validates :shipping_cost_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :prefecture_id,    numericality: { other_than: 1, message: "can't be blank"}
    validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :price,            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "is out of setting range" }
  end
end
