class User < ActiveRecord::Base
    rolify
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable,:omniauthable, :trackable, :validatable

    has_and_belongs_to_many :categories
    has_and_belongs_to_many :communities
    has_and_belongs_to_many :meetings

    def self.new_with_session(params, session)
        super.tap do |user|
            if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
                user.email = data["email"] if user.email.blank?
            end
        end
    end

    def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
        user = User.where(:provider => auth.provider, :uid => auth.uid).first
        unless user
            user = User.create(name:auth.extra.raw_info.name,
                               provider:auth.provider,
                               uid:auth.uid,
                               email:auth.info.email,
                               password:Devise.friendly_token[0,20]
                              )
        end
        user
    end


end
