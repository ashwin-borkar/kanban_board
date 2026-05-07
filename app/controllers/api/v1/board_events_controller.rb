class Api::V1::BoardEventsController < ApplicationController
  def index
    events = BoardEvent.chronological
    render json: events
  end
end
