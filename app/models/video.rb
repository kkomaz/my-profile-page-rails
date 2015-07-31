class Video < ActiveRecord::Base
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["video/mp4", "image/jpg", "image/jpeg"] 
  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
end
