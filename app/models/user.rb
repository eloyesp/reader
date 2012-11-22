class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login_or_email]

  attr_accessor :login_or_email

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :login, :email, :password,
                  :password_confirmation, :remember_me, :login_or_email

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login_or_email = conditions.delete(:login_or_email)
      where(conditions).where(["lower(login) = :value OR lower(email) = :value",
        { :value => login_or_email.downcase }]).first
    else
      where(conditions).first
    end
  end

end
