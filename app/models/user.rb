class User < ActiveRecord::Base
  require 'role_model'
  include RoleModel
  has_and_belongs_to_many :exercices
  before_save :save_token_user
  after_save :create_progression_folder
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  roles_attribute :roles_mask
  roles :guest, :user, :admin

  def save_token_user
    if self.token_authenticatable == ""
      self.token_authenticatable = loop do
        token = SecureRandom.urlsafe_base64(nil, false)
        break token unless User.exists?(token_authenticatable: token)
      end
      Dir.mkdir("app/users_progression/#{self.token_authenticatable}/")
    end
  end

  def create_progression_folder
      #Dir.mkdir("app/users_progression/#{self.token_authenticatable}/") unless File.directory?("app/users_progression/#{self.token_authenticatable}/")
  end

end
