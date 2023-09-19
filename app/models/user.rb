class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_create :password_check
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, format: { with: /\A(?=.*[!@#$%^&*])/, message: "must include at least one special character" }
 


def password_check

  unless password.length <= 10
    errors.add(:password, "must be up to 10 characters long") # Add a custom error message
    throw(:abort) # Prevent the user from being created
  end

end 
end
