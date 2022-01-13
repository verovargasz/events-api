class Api::V1::EventsController < Api::V1::BaseController
  before_action :set_event, only: [ :show ]
  # before_action :set_utc_time_zone, except: [ :create ]

  def index
    @events = Event.all
  end

  def show
  end

  def create
    Time.zone = event_params[:time_zone]
    @event = Event.new(event_params)
    if @event.save
      set_utc_time_zone
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

  def set_utc_time_zone
    Time.zone = "UTC"
  end
end
