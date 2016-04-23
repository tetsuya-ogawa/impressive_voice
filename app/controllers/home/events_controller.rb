class Home::EventsController < ApplicationController

  layout 'public_page'

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @groups = Group.where(event_id: params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy

  end


end