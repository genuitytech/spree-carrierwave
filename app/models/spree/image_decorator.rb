Spree::Image.class_eval do
  class Uploader < CarrierWave::Uploader::Base
    include CarrierWave::Compatibility::Paperclip
    include CarrierWave::MiniMagick

    storage :fog

    # Spree looks in attachment#errors, so just delegate to model#errors
    delegate :errors, :to => :model

    # Match the path defined in Spree::Image
    def paperclip_path
      "assets/products/:id/:style/:basename.:extension"
    end

    # These are the versions defined in Spree::Image
    version :mini do
      process :resize_to_limit => [48, 48]
    end

    version :small do
      process :resize_to_limit => [100, 100]
    end

    version :product do
      process :resize_to_limit => [240, 240]
    end

    version :large do
      process :resize_to_limit => [600, 600]
    end
  end

  mount_uploader :attachment, Uploader, :mount_on => :attachment_file_name

  # Get rid of the paperclip callbacks

  def save_attached_files; end
  def prepare_for_destroy; end
  def destroy_attached_files; end
end
