class ParticipationsController < ApplicationController

def new 
	@events = Event.all
	@y = @events.find(params[:event_id])
	@price = @y.price
end 

def index 
	#@users = User.all 
	@events = Event.all
	#@attendance = Attendance.all
	
	#@my_user = current_user
	@my_event = @events.find(params[:event_id])
	#@user_id = User.where(id: @participant)

  	@participations = Attendance.where(event_id: params[:event_id])
  	@participants = []
  	@participations.each do |e|
  	@participants << User.find(e.participant_id)
  	end
end 



end
