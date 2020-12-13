class Post < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :dateposted, presence: true

  validate :body_entered

  def body_entered
    if image.nil? && content.blank?
      errors.add(:content, "should be filled in OR")
      errors.add(:image, "should be filled in")
    end
  end
end
