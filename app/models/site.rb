class Site < ApplicationRecord
  has_many :docs
  has_many :layouts
end
