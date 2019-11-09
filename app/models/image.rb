class Image < ApplicationRecord
  # アイテム用のイメージモデル
  belongs_to :item, optional: true
  mount_uploaders :image, ImageUploader

  # validates :content, presence: true

end
