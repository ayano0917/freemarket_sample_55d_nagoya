class Image < ApplicationRecord
  # アイテム用のイメージモデル
  mount_uploader :image, ImageUploader
  belongs_to :item, optional: true

  validates :image, presence: true
end
