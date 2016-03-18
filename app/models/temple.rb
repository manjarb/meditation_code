class Temple < ActiveRecord::Base
  belongs_to :admin_user
  has_many :activities, dependent: :destroy
  default_scope -> { order(created_at: :desc) }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :admin_user_id, presence: true
  validates :name, presence: true ,uniqueness: true ,length: {maximum: 255}
  validates :address, presence: true ,length: {maximum: 3000}
  validates :phone_number, presence: true ,length: {maximum: 20},
            numericality: { only_integer: true }
  validates :email, length: {maximum: 255},
            format: { with: VALID_EMAIL_REGEX },
            case_sensitive: false

  validates :website , uniqueness: true
  validates :country, presence: true
  validates :city, presence: true
  validate :picture_size

  validates :temple_image01, presence: true
  validates :temple_image02, presence: true
  validates :temple_image03, presence: true

  mount_uploader :temple_image01, PictureUploader
  mount_uploader :temple_image02, PictureUploader
  mount_uploader :temple_image03, PictureUploader
  mount_uploader :temple_image04, PictureUploader
  mount_uploader :temple_image05, PictureUploader
  mount_uploader :temple_image06, PictureUploader
  mount_uploader :logo_url, PictureUploader
  mount_uploader :map_image_url, PictureUploader

  private

  #Validate picture size
  def picture_size
    if temple_image01.size > 5.megabytes
      errors.add(:temple_image01, "Temple Image 01 should be less than 5MB")
    end

    if temple_image02.size > 5.megabytes
      errors.add(:temple_image02, "Temple Image 01 should be less than 5MB")
    end

    if temple_image03.size > 5.megabytes
      errors.add(:temple_image03, "Temple Image 01 should be less than 5MB")
    end

    if temple_image04.size > 5.megabytes
      errors.add(:temple_image04, "Temple Image 01 should be less than 5MB")
    end

    if temple_image05.size > 5.megabytes
      errors.add(:temple_image05, "Temple Image 01 should be less than 5MB")
    end

    if temple_image06.size > 5.megabytes
      errors.add(:temple_image06, "Temple Image 01 should be less than 5MB")
    end

    if logo_url.size > 5.megabytes
      errors.add(:logo_url, "Temple Image 01 should be less than 5MB")
    end

    if map_image_url.size > 5.megabytes
      errors.add(:map_image_url, "Temple Image 01 should be less than 5MB")
    end
  end

end
