# encoding: utf-8
require 'carrierwave/processing/mini_magick'

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  
  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  version :thumb do
    process :resize_to_fill => [80,80]
  end
end
