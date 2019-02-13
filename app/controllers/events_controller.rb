class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.create(title: params[:title], description: params[:description], start_date: params[:start_date], duration: params[:duration], price: params[:price], location: params[:location])
    @event.administrator = current_user

    if @event.save
      redirect_to @event
    else
      render 'new'
    end

    def subscription
    @event = Event.find(params[:id])
    @amount = @event.price * 100

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

    redirect_to @event

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to @event
    end
  end

  def destroy
   @event = Event.find(params[:id])

   @event.destroy
   redirect_to events_path
 end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to event_path
    else
    render :update
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location)
  end
end
