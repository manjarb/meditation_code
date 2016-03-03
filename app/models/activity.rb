class Activity < ActiveRecord::Base
  belongs_to :admin_user
  belongs_to :temple

  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy

  #default_scope -> { order(created_at: :desc) }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :admin_user_id, presence: true
  validates :temple_id, presence: true
  validates :name, presence: true, uniqueness: true ,length: {maximum: 255}
  validates :details, presence: true
  validates :activity_image01_url, presence: true
  validates :activity_image02_url, presence: true
  validates :activity_image03_url, presence: true
  validates :rules, length: {maximum: 1000}
  validates :apply_details, length: {maximum: 1000}
  validate :youtube_url_format
  validate :permanent_event_check

  mount_uploader :activity_image01_url, PictureUploader
  mount_uploader :activity_image02_url, PictureUploader
  mount_uploader :activity_image03_url, PictureUploader

  private

  def permanent_event_check

    if self.permanent == false
      if self.start_at.nil? || self.end_at.nil?
        self.errors[:base] << "You can't leave start and end date blank with Permanent Event"
        return false
      end
    end
  end

  def youtube_url_format
    youtube_regex = /youtube.com.*(?:\/|v=)([^&$]+)/

    unless self.youtube_url == ""
      unless self.youtube_url =~ youtube_regex
        self.errors[:base] << "Youtube Wrong Format"
        return false
      end
    end
  end


end
