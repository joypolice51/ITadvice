class Direct < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :direct_users, dependent: :destroy
end
