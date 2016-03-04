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
            case_sensitive: false
  validates :phone_number, presence: true

  before_save { self.email = self.email.downcase }
  before_save { self.confirm_email = self.confirm_email.downcase }

  validate :check_email_confirmation
  validate :check_redundent_reservation

  private

  def check_email_confirmation

    if self.email == self.confirm_email

    else
      self.errors[:base] << "Your email confirmation didn't match"
      return false
    end
  end

  def check_redundent_reservation

    activity_find = Reservation.find_by(activity_start_date: self.activity_start_date,
                                        payment_made: self.payment_made)
    activity_find_end = Reservation.find_by(activity_end_date: self.activity_start_date,
                                            payment_made: self.payment_made)

    if activity_find || activity_find_end
      self.errors[:base] << "You already made the reservation on this day"
    else

    end

  end

end
