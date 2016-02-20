class Upload < ActiveRecord::Base
  belongs_to :user
  has_attached_file :document
  validates_attachment_content_type :document, :content_type => ["application/pdf", "application/force-download"]
  validates_with AttachmentPresenceValidator, attributes: :document
  validates_with AttachmentSizeValidator, attributes: :document, less_than: 2.megabytes
  validates :subject, presence: true, length: { maximum: 4 }
  validates :course, presence: true, length: { maximum: 4 }
  validates :term, presence: true, length: { maximum: 2 }
  validates :year, presence: true
  validates :instructor, presence: true, length: { maximum: 15 }
  validates :type_of, presence: true, length: { maximum: 10 }
  validates :type_num, presence: true
end
