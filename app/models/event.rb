class Event < ApplicationRecord
  belongs_to :event_category
  belongs_to :admin

  mount_uploader :image, EventUploader
end
