class User < ApplicationRecord
  has_many :pieces # Creating user to pieces association
  has_many :games # Creating user to games association
  has_many :chats # assoication for chatting agmounst users
  validates :username, presence: true, uniqueness: { case_sensitive: false } # for pusher - messaging
  validates :is_signed_in, inclusion: [true, false] # for pusher - user presense
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         #:omniauthable, :omniauth_providers => [:facebook, :twitter] #this added the omni links in routes
          :omniauthable, :omniauth_providers => [:facebook, :twitter, :google_oauth2]
  after_create :notify_pusher


#this was suggested by tutorials Wilson suggested so users can log in with social media
#makes the pair (provider :socialmedia, uid: your_uid) match and creates them if they aren't in db
  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end      
  end

  def notify_pusher 
        Pusher.trigger('activity', 'login', self.as_json)
  end

  def as_json(options={}) 
    super(
      only: [:id, :email, :username]
    )
  end
end
