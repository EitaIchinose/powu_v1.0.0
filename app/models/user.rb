class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'は半角英数字不可です' } do
      validates :family_name
      validates :given_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナのみ登録可能です' } do
      validates :family_name_kana
      validates :given_name_kana
    end
    validates :birthday
  end

  validates :password, :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: 'は登録不可能な値です' },
                                               on: :create

  has_many :events
  has_many :comments
end
