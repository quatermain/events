class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :register, :unregister]
  before_action :check_user, only: [:edit, :update, :destroy]
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    if current_user
      @registered = @event.users.pluck(:id).include?(current_user.id)
    end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user = current_user
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def register
    if current_user
      UserEvent.where(user_id: current_user.id, event_id: @event.id).first_or_create
      redirect_to event_url(@event)
    else
      redirect_to root_url
    end
  end

  def unregister
    if current_user
      @user_event = UserEvent.where(user_id: current_user.id, event_id: @event.id).first
      if @user_event
        @user_event.destroy
      end
      redirect_to event_url(@event)
    else
      redirect_to root_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :user_id, :description, :date, :active)
    end

  def check_user
    if current_user && current_user.id == @event.user_id
    else
      redirect_to events_url
    end
  end
end
