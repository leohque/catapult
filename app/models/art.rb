class Art < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :art_orders, dependent: :destroy
  has_many :orders, through: :art_orders

  validates :name, :description, :price, presence: { message: "This box can not be blank" }
  validates :photos, attached: true, content_type: [:png, :jpg, :jpeg, :pdf]

end
