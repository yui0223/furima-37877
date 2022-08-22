class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

    validates :nickname,        presence: true
    validates :last_name,       presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name,      presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name_kana,  presence: true, format: { with: /\A[ァ-ヴー]+\z/u }
    validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヴー]+\z/u }
    validates :birthday,        presence: true
  end
end
