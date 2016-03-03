class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity

  attr_accessor :confirm_email
end
