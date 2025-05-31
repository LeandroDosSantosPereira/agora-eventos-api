class EventCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :events
end
