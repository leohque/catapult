class Order < ApplicationRecord
  belongs_to :user
  has_many :art_orders
  has_many :arts, through: :art_orders

  STATUS = ['open', 'cancelled', 'confirmed']
end
