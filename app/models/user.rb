class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         #:omniauthable, :omniauth_providers => [:facebook, :twitter] #this added the omni links in routes
          :omniauthable, :omniauth_providers => [:facebook]

#this was suggested by tutorials Wilson suggested so users can log in with social media
#makes the pair (provider :socialmedia, uid: your_uid) match and creates them if they aren't in db
  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end      
  end
end
