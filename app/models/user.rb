class User < ApplicationRecord
  has_many :users_roles
  has_many :roles, through: :users_roles
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :password, format: { with: /[\!@#\$%\^&\*]/, message: "must include at least one special character" }, on: :create
  after_initialize :set_default_role, if: :new_record?
  PER_PAGE = 10;

  def set_default_role
    self.users_roles.build(role_id: Role.find_by(role: 'Customer').id)
  end

  Role.pluck(:role).each do |role_name|
    define_method("is_#{role_name.downcase}?") do
      roles.map {|r| r.role}.include?(role_name)
    end
  end
end
