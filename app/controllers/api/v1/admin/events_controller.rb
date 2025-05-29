module Api
  module V1
    module Admin
      class EventsController < ApplicationController
        before_action :authenticate_admin! # para garantir que o usuário está autenticado como admin
        before_action :set_event, only: [:show, :update, :destroy]

        # GET /api/v1/admin/events
        def index
          @events = Event.where(admin_id: current_admin.id)
          render json: @events
        end

        # GET /api/v1/admin/events/:id
        def show
          render json: @event
        end

        # POST /api/v1/admin/events
        def create
          @event = Event.new(event_params)
          if @event.save
            render json: @event, status: :created
          else
            render json: @event.errors, status: :unprocessable_entity
          end
        end

        # PATCH/PUT /api/v1/admin/events/:id
        def update
          if @event.update(event_params)
            render json: @event
          else
            render json: @event.errors, status: :unprocessable_entity
          end
        end

        # DELETE /api/v1/admin/events/:id
        def destroy
          @event.destroy
          head :no_content
        end

        private

        # Use callbacks to share common setup or constraints between actions.
        def set_event
          @event = Event.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def event_params
          params.require(:event).permit(:title, :description, :date, :time, :location, :image, :capacity, :price, :organizer, :event_category_id, :admin_id)
        end
      end
    end
  end
end
