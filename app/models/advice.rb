class Advice < 
  belongs_to :room
  belongs_to :user
  belongs_to :question
  attribute :public, :boolean, default: false      ##公開非公開設定
end
