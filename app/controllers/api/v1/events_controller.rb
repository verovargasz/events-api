class Api::V1::EventsController < Api::V1::BaseController
  before_action :set_event, only: [ :show ]

  def index
    @events = Event.all
  end

  def show
  end

  def create
    @event = Event.new(event_params)
    @event.start_date = @event.start_date.utc
    @event.end_date = @event.end_date.utc
    @event.time_zone = "UTC"
    if @event.save
      render :show
    else
      render_error
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :start_date, :end_date, :time_zone)
  end

  def render_error
    render json: { errors: @event.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_user_time_zone
    Time.zone = @event.time_zone
  end
end
