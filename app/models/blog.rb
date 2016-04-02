class Blog < ActiveRecord::Base

  belongs_to :admin_user
  default_scope -> { order(created_at: :desc) }

  has_and_belongs_to_many :tags , dependent: :destroy

  validates :admin_user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true

end
