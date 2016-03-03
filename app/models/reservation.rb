class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity

  attr_accessor :confirm_email

  default_scope -> { order(created_at: :desc) }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :user_id, presence: true
  validates :activity_id, presence: true
  validates :quantity, presence: true
  validates :firstname, presence: true ,length: {maximum: 50}
  validates :lastname, presence: true ,length: {maximum: 50}
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true,
            case_sensitive: false
  validates :phone_number, presence: true

  before_save { self.email = self.email.downcase }

  validate :check_email_confirmation

  private

  def check_email_confirmation
    if self.email == self.confirm_email

    else
      self.errors[:base] << "You can't leave start and end date blank with Permanent Event"
      return false
    end
  end

end
