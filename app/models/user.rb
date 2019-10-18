class User < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_location_and_first_name_and_last_name, :against => [:address, :first_name, :last_name],
    using: {
      :tsearch => {:prefix => true}
    }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader
  has_many :invites
  has_many :photos
end
