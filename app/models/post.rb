class Post < ApplicationRecord
  belongs_to :category
  belongs_to :writer
  belongs_to :series

  has_one :popular_post, dependent: :destroy

  before_create :time_create
  before_update :time_update

  acts_as_taggable

  validates :title, presence: true
  validates :category_id, presence: true
  validates :text, presence: true
  validates :image, presence: true

  mount_uploader :image, PostImageUploader

  enum published: { Draft: false, Published: true }

  scope :default_order, -> { order('time desc') }
  scope :published, -> { where(published: true) }
  scope :drafts, -> { where(published: false) }
  scope :favorite, -> { where(favorite: true) }

  def to_param
    slug
  end

  def previous
    Post.published.default_order.find_by('created_at < ?', created_at)
  end

  def next
    Post.published.default_order.where('created_at > ?', created_at).reverse.first
  end

  private

  def time_create
    if self.Published?
      self.time = Time.zone.now
    end
  end

  def time_update
    if self.published_changed?(from: "Draft", to:"Published")
      self.time = Time.zone.now
    elsif self.published_changed?(from: "Published", to:"Draft")
      self.time = nil
    end
  end

end
