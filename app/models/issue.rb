class Issue < ApplicationRecord
  validates :message, presence: true
  validates :email, presence: true
  validates :name, presence: true
end
