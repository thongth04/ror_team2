class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :orders
  has_many :notifications
  has_many :notifications, dependent: :destroy
#   before_save { self.email = email.downcase }

#   validates :username, presence: true,
#                       uniqueness: true,
#                       length: { minimum:3, maximum: 25 }

#   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#   validates :email, presence: true,
#                   uniqueness: { case_sensitive: false },
#                   length: { maximum: 105 },
#                   format: { with: VALID_EMAIL_REGEX }

end
