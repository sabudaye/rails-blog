class ApplicationUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage configus.carrierwave.storage

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "system/uploads/#{model.class.model_name.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  #TODO add this if defaut post image needed
  # def default_url
  #   "/images/fallback/#{model.class.model_name.to_s.underscore}/" << [mounted_as, version_name].compact.join("_") << ".gif"
  # end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
