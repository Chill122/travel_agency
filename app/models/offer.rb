class Offer < ActiveRecord::Base
    has_many :comments
    has_many :reservations
    belongs_to :accommodation
    mount_uploader :image, ImageUploader
end
