class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  has_many :tasks
  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_many :reviews
  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  },
  default_url: "/images/:style/missing.png"


  validates :name, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 500 }
  validates :price, presence: true, numericality: {only_integer: true}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def trimmedName
    name.length > 23? name[0..23] + "..." : name
  end

  def average_rating
    reviews.blank? ? 0 : reviews.average(:star).round(2)
  end
end
