class User < ActiveRecord::Base
  has_secure_password
  validates :username,
    presence: true,
    length: {minimum: 5},
    uniqueness: true,
    :on => [:create, :new]
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
    presence: true,
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: true,
    :on => [:create, :new]
  validates :password,
    presence: true,
    length: {minimum: 6},
    :on => [:create, :new]
  validates_confirmation_of :password,
    :on => [:create, :new]

  require 'securerandom'

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.password = SecureRandom.hex(8)
      user.save!
    end
  end

end
