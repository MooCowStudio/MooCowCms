class Layout < ApplicationRecord
  has_many :docs
  belongs_to :site
end
