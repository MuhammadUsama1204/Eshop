class User < ApplicationRecord
  has_many :users_roles, class_name: "UsersRole"
  has_many :roles, through: :users_roles
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :password, format: { with: /[\!@#\$%\^&\*]/, message: "must include at least one special character" }, on: :create
end
