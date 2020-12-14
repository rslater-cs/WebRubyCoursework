class Post < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :dateposted, presence: true
  validate :content_presence_check

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  validate :body_entered

  #for a post to be valid, it must either have an image or text for body, it may also have both
  # this code checks that the post fits the requirement
  def body_entered
=======
  def content_presence_check
>>>>>>> parent of badd54f... created jquery validation for sign in field
=======
  def content_presence_check
>>>>>>> parent of badd54f... created jquery validation for sign in field
=======
  def content_presence_check
>>>>>>> parent of badd54f... created jquery validation for sign in field
    if image.nil? && content.blank?
      errors.add(:content, "is empty")
      errors.add(:image, "is empty")
    end
  end
end
