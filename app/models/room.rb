class Room < ApplicationRecord
  has_many :questions
  belongs_to :user

  validates :name, presence: true
end
