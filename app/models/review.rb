class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :activity

  validates :score ,numericality: { only_integer: true ,:greater_than_or_equal_to => 0,:less_than_or_equal_to => 10 },
                    presence: true
  validates :comment, presence: true , length: { maximum: 500 }


end
