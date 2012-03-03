class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  attr_accessor :password_confirmation, :by, :current_password
  validates :name, :presence => true, :length => {:in => 3..20}, :uniqueness => {:case_sensitive => false}
  def admin?
    return true if Settings.admin_emails.include?(self.email)
    return false;
  end
end
