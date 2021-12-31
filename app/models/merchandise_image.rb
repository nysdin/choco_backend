class MerchandiseImage < ApplicationRecord
  belongs_to :merchandise
  mount_base64_uploader :url, MerchandiseImageUploader
end
