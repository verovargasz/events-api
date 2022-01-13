class PagesController < ApplicationController
  def home
    @event = Event.new
  end

  private

  def set_user_time_zone
    Time.zone = current_user.time_zone
  end
end
