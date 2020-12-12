class Post < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :dateposted, presence: true
  validate :content_presence_check

  def content_presence_check
    if image.nil? && content.blank?
      errors.add(:content, "is empty")
      errors.add(:image, "is empty")
    end
  end
end
