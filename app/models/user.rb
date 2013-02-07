# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  oauth_token      :string(255)
#  oauth_expires_at :datetime
#  uid              :string(255)
#  provider         :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #
  #
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :timeoutable, :omniauthable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :name  , :remember_me
  validates_presence_of :email
  # validates :username, :format => { :with => /^(?!_)(?:[a-z0-9]_?)*[a-z](?:_?[a-z0-9])*(?<!_)$/i }, :uniqueness => true
  has_one :image, :as => :imageable, :order => "created_at DESC"
  has_many :bars, dependent: :destroy


  after_create :welcome_mail




  def welcome_mail( _password = nil )
    if ( self.provider.blank? and _password.blank? )
      Notifier.welcome(self).deliver
    elsif ( self.provider.present? and _password.present? )
      Notifier.welcome(self, _password).deliver
    end
  end

  def self.new_with_session( params, session )
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"],without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def self.from_omniauth( auth )
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    end
  end
end
