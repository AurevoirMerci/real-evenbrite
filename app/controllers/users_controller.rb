class UsersController < ApplicationController

def show
@users = User.all 
@g = @users.find(params[:id])
@events = Event.all
end


end
