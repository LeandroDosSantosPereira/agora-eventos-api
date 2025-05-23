class Event < ApplicationRecord
  belongs_to :event_category
  belongs_to :admin
end
