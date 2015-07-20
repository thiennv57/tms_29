class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    Settings.user.avatar.store_dir
  end

  def extension_white_list
    Settings.user.avatar.extension_white_list
  end
end
