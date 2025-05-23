class Event < ApplicationRecord
  belongs_to :event_category
  belongs_to :admin

  has_one_attached :image
end
