CarrierWave.configure do |config|
  config.storage = :grid_fs
  config.grid_fs_connection = Mongoid.database
  config.grid_fs_access_url = "/gridfs"

  config.cache_dir = "uploads"
  config.root = Rails.root.join('tmp')
end
