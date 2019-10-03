class Doc < ApplicationRecord
  belongs_to :site
  belongs_to :layout
  has_many :access_logs, :dependent => :delete_all
  has_rich_text :content
  mount_uploader :image, MainImageUploader
end
