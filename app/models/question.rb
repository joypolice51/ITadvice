class Question < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_many   :advices

  # 解決済み状態を示すフィールド
  attribute :resolved, :boolean, default: false  
end
