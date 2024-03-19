class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "はひらがな、カタカナ、漢字のみ使用できます" }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "はひらがな、カタカナ、漢字のみ使用できます" }
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :birth_date, presence: true
  validates :password, format: { with: /\A(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]+)\z/, message: "は半角英数字混合で入力してください" }
  validates :password, presence: true, length: { minimum: 6 }
end