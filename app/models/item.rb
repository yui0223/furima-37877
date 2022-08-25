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
    
    validates :name,             presence: true
    validates :image,            presence: true
    validates :description,      presence: true
    validates :category_id,      presence: true, numericality: { other_than: 1}
    validates :status_id,        presence: true, numericality: { other_than: 1}
    validates :shipping_cost_id, presence: true
    validates :prefecture_id,    presence: true, numericality: { other_than: 1}
    validates :shipping_date_id, presence: true, numericality: { other_than: 1}
    validates :price,            presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end