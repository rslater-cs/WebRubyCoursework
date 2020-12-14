class Post < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :dateposted, presence: true

  validate :body_entered

  #for a post to be valid, it must either have an image or text for body, it may also have both
  # this code checks that the post fits the requirement
  def body_entered
    if image.nil? && content.blank?
      errors.add(:content, "should be filled in OR")
      errors.add(:image, "should be filled in")
    end
  end
end
