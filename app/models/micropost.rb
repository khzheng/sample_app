class Micropost < ActiveRecord::Base
  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :content
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
end
