class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]



	def index
		@events = Event.all
	end

	def new
	  #@events = Event.new
	end

	def create
      @events = Event.new(title: params[:title], description: params[:description], admin_id: current_user.id, location: params[:location], start_date: params[:start_date], price: params[:price], duration: params[:duration])
       if @events.save
      redirect_to event_path(@events.id)
       else
     render :new
   	  end
	end

	def show 
	  @events = Event.all
	  @g = Event.find(params[:id])
	  @users = User.find(@g.admin.id)
	  @attendances = Attendance.where(event_id: @g.id)
	  @attendees = Attendance.all
	  @e = @attendees.find(params[:id])
	  puts @g.inspect
	end

	def destroy
   	  @events = Event.find(params[:id])
  	  @events.destroy
  	  redirect_to root_path
  	end

	def edit 
		@events = Event.find(params[:id])
	end 

	 def update
      @events = Event.find(params[:id])
       if @events.update(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location])
      redirect_to event_path(params[:id])
   	   else
      redirect_to edit_event_path(params[:id])
    end
    end 


end
