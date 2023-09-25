class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :password, format: { with: /[\!@#\$%\^&\*]/, message: "must include at least one special character" }, on: :create
end
