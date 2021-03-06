class Post < ApplicationRecord
  acts_as_votable
  validates :message, presence: true, unless: ->(post) { post.image.present? }
  validates :image, presence: true, unless: ->(post) { post.message.present? }

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_attached_file :image,
  styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  include PublicActivity::Model
  tracked
end
