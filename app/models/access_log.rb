class AccessLog < ApplicationRecord
  belongs_to :site
  belongs_to :doc
end
