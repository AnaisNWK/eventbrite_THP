class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  	@event = Event.all
  end

  
end
