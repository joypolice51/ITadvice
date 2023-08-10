class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :questions
  has_many :advices
  has_many :messages, dependent: :destroy
  has_many :direct_users, dependent: :destroy

  with_options presence: true do
    # ひらがな、カタカナ、漢字のみ許可する
    validates :name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    # ひらがな、カタカナ、漢字のみ許可する
    validates :span, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    # ひらがな、カタカナ、漢字のみ許可する
    validates :field, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}  
  end  
end
