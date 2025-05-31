class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :event_category
  belongs_to :admin

  mount_uploader :image, EventUploader
end
