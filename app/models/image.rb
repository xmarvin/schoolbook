class Image
  include Mongoid::Document

  belongs_to :book
  mount_uploader :image, ImageUploader
end
