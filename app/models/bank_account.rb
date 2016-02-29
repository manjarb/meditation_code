class BankAccount < ActiveRecord::Base
  belongs_to :admin_user

  default_scope -> { order(created_at: :desc) }

  validates :name, presence: true ,length: {maximum: 255}
  validates :owner_account_name, presence: true ,length: {maximum: 255}
  validates :number, presence: true ,length: {maximum: 255}
  validates :bank_name, presence: true ,length: {maximum: 255}
end
