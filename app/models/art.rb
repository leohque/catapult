class Art < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :art_orders, dependent: :destroy
  has_many :orders, through: :art_orders

  validates :name, :description, :price, presence: { message: "This box can not be blank" }
  validates :photos, attached: true, content_type: [:png, :jpg, :jpeg]

  # after_commit :create_hash_tags, on: :create


  # def create_hashtags
  #   extract_hashtags.each do |name|
  #     hash_tags.create(name: name)
  #   end
  # end

  def extract_hashtags
    description.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
  end

end
