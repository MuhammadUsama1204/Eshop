class User < ApplicationRecord
  has_many :users_roles
  has_many :roles, through: :users_roles
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :password, format: { with: /[\!@#\$%\^&\*]/, message: "must include at least one special character" }, on: :create
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.users_roles.build(role_id: Role.find_by(role: 'Customer').id)
  end
end
