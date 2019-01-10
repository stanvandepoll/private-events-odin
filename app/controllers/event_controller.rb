class EventController < ApplicationController
  def index
    @all_events = Event.all
  end

  def show
    @event = Event.find_by(id: params[:format])
  end

  def new
    @event = Event.new
  end

  def create
    current_user = User.find_by_id(session[:logged_in_user_id])
    @event = current_user.created_events.build(event_params)
    @event.save
    redirect_to event_show_url(@event)
  end

  private

    def event_params
      params.require(:event).permit(:date, :location, :description)
    end
end
