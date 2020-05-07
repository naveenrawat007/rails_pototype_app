class Photo < ApplicationRecord
  mount_uploader :name, ImageUploader
  belongs_to :image, polymorphic: true
end
