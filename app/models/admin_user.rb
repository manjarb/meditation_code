class AdminUser < ActiveRecord::Base
  has_many :temples, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :bank_accounts, dependent: :destroy
  attr_accessor :remember_token, :reset_token
  before_save { self.email = self.email.downcase }

  validates :username, presence: true, uniqueness: true ,length: {maximum: 50}
  validates :name, presence: true, uniqueness: true ,length: {maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true ,length: {maximum: 255},
                    format: { with: VALID_EMAIL_REGEX },
                    case_sensitive: false

  has_secure_password
  validates :password ,length: { minimum: 6 }

  #Return hash digest of the given string
  def AdminUser.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost

    BCrypt::Password.create(string, cost: cost)
  end

  def AdminUser.new_token
    SecureRandom.urlsafe_base64
  end

  def AdminRemember
    self.remember_token = AdminUser.new_token
    update_attribute(:remember_digest, AdminUser.digest(remember_token))
  end

  #Return true if the given token matches the digest
  def authenticated?(attribute,token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password?(token)
  end

  # Forgets User
  def admin_forget
    update_attribute(:remember_digest,nil)
  end

  # Sets the password reset attributes
  def create_reset_digest
    self.reset_token = AdminUser.new_token
    update_attribute(:reset_digest, AdminUser.digest(reset_token))
    update_attribute(:reset_sent_at, Time)
  end

  def send_password_reset_email
    UserMailer.admin_password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

end
