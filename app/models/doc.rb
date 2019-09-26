class Doc < ApplicationRecord
  belongs_to :site
  belongs_to :layout
  has_rich_text :content
  mount_uploader :image, MainImageUploader
end
