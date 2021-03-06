class Post < ActiveRecord::Base
  has_attached_file :image, :styles => {:large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :public_posts, -> { where(public: true) }

  def should_generate_new_friendly_id?
    title_changed?
  end
end
