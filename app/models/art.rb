class Art < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :art_orders
  has_many :orders, through: :art_orders
end
