module Api
  module V1
    module Admin
      class EventCategoriesController < ApplicationController
        def index
          @event_categories = EventCategory.all
          render json: @event_categories, status: :ok
        end
      end
    end
  end
end
