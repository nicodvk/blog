# encoding: utf-8
require 'carrierwave/processing/mini_magick'

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  
  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def default_url
    "/fallback/" + [version_name, "avatar_default.png"].compact.join('_')
  end

  version :thumb do
    process :resize_to_fill => [80,80]
  end
end
