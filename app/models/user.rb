class User < ApplicationRecord
  has_many :users_roles
  has_many :roles, through: :users_roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :password, format: { with: /[\!@#\$%\^&\*]/, message: "must include at least one special character" }
  # enum role: {
  #   admin: 'admin',
  #   staff: 'staff',
  #   customer: 'customer'
  # }

 
end
