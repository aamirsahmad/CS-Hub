class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  has_many :tasks
  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_attached_file :image, styles: { medium: "680x300>", thumb: "170x75>" }, default_url: "/images/:style/missing.png"
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 500 }
  validates :price, presence: true, numericality: {only_integer: true}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
