class User < ActiveRecord::Base

  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy
  attr_accessor :remember_token, :reset_token,:activation_token

  validates :name, presence: true ,length: {maximum: 50}
  validates :username, presence: true ,uniqueness: true ,length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true,
            case_sensitive: false

  validates :password ,length: { minimum: 8 } ,allow_blank: true

  before_save { self.email = self.email.downcase }
  before_create :create_activation_digest

  has_secure_password

  has_many :wishlists , dependent: :destroy

  class << self
    #Return hash digest of the given string
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
          BCrypt::Engine.cost

      BCrypt::Password.create(string, cost: cost)
    end

    #Return a random token
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  #Remembers a user in the database for use in persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  #Return true if the given token matches the digest
  def authenticated?(attribute,token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute(:remember_digest,nil)
  end

  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end


  ####### FB LOGIN

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      # puts "auth.providerauth.providerauth.providerauth.provider"
      # puts auth.info.inspect

      user.provider = auth.provider
      user.uid = auth.uid
      user.id = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.username = auth.info.name.gsub(" ","") + new_token
      user.login_type = "facebook"
      user.activated = true
      user.activated_at = Time.zone.now

      if auth.info.email.nil?
        user.email = "admin@thaimeditation.com"

      else
        user.email = auth.info.email

      end

      user.password = digest(new_token)
      user.save!
    end
  end

  ####### FB LOGIN

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,User.digest(reset_token))
    update_attribute(:reset_sent_at,Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  private

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

end
