class User < ActiveRecord::Base
 has_many :notes, dependent: :destroy
   has_many :likes, dependent: :destroy
  has_many :like_notes, through: :likes, source: :note

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


   validates :user_name, length:{ maximum:10}, presence:true
   validates :profile, length:{maximum:1000}, presence:false
   validates :area, presence:false



 acts_as_messageable

def mailboxer_user_name
  self.user_name
end

def mailboxer_email(object)
  self.email
end

    mount_uploader :profile_pic



def self.find_for_facebook_oauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    unless user
      user = User.create( user_name:     auth.extra.raw_info.name,
                          provider: auth.provider,
                          uid:      auth.uid,
                          email:    auth.info.email,
                          token:    auth.credentials.token,
                          password: Devise.friendly_token[0,20] )
    end
  user
end


end
