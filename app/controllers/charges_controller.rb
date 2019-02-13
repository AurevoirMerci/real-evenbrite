class ChargesController < ApplicationController

def new
end

def create
  # Amount in cents
  @events = Event.all
  @y = @events.find(params[:event_id])
  @price = @y.price
  @id = current_user.id
  @amount = @price * 100

@attendances = Attendance.new(stripe_customer_id: params[:stripeToken], participant_id: @id, event_id: @y.id)
#puts "*" * 60
#puts @attendances.inspect

    if @attendances.save
      redirect_to events_path
    end 

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'eur'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end

end
