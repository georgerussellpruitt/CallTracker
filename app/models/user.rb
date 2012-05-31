class User < ActiveRecord::Base

  belongs_to :group
  belongs_to :user_location
  has_many :calls

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable, :validatable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :group_id

  def user_full_name
    self.first_name + " " + self.last_name
  end

  def role?(role_check)
    if self.group.group_name.to_s == role_check.to_s
      return true
    end
  end

  def role
    return group.group_name.to_s
  end

end
