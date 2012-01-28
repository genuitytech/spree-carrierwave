Spree::Image.class_eval do
  class Uploader < CarrierWave::Uploader::Base
    include CarrierWave::Compatibility::Paperclip
    storage :fog
  end

  mount_uploader :attachment, Uploader, :mount_on => :attachment_file_name

  # Get rid of the paperclip callbacks

  def save_attached_files; end
  def prepare_for_destroy; end
  def destroy_attached_files; end
end
