class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :password, format: { with: /[\!@#\$%\^&\*]/, message: "must include at least one special character" }
  enum role: {
    admin: 'admin',
    staff: 'staff',
    customer: 'customer'
  }

 
end
