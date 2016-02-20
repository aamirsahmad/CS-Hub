class Upload < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :subject, presence: true, length: { maximum: 4 }
  validates :course, presence: true, length: { maximum: 4 }
  validates :term, presence: true, length: { maximum: 2 }
  validates :year, presence: true
  validates :instructor, presence: true, length: { maximum: 15 }
  validates :type_of, presence: true, length: { maximum: 10 }
  validates :type_num, presence: true
end
