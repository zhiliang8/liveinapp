class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :apps
  has_many :app_usings
  has_many :using_apps, :through => :app_usings, :source => :app
  has_many :feeds
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :website, :tags
  attr_accessor :password_confirmation, :by, :current_password
  validates :name, :presence => true, :length => {:in => 3..20}, :uniqueness => {:case_sensitive => false}
  
  def admin?
    return true if Settings.admin_emails.include?(self.email)
    return false
  end
  
  def using(app)
    self.using_apps.where('app_id=? ', app.id).first
  end
  
  def use(app)
    @appUsing = AppUsing.new
    @appUsing.user_id = self.id
    @appUsing.app_id = app.id
    @appUsing
  end
  
  def self.current
    Thread.current[:user]
  end
  
  def self.current=(user)
    Thread.current[:user] = user
  end
end
