class GuestsController < ApplicationController
  before_action :set_guest, only: [:destroy]
  before_action :set_event


  def new
		@guest = Guest.new
  end

	def create
		@guest = Guest.new(guest_params)
    @guest.event = @event

    if @guest.save
      flash[:notice] = 'You have successfully registered!'
      redirect_to event_path(@event)
    else
      flash[:alert] = 'Your registration failed, please make sure your information is correct.'
      render "new"
    end
  end

  def destroy
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Guest was successfully removed.' }
      format.json { head :no_content }
    end
  end

	private
	def guest_params
    params.require(:guest).permit(:firstname, :lastname, :email)
  end
  def set_guest
    @guest = Guest.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

end
