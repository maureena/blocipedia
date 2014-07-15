class ChargesController < ApplicationController
  
  def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Blocipedia Membership - #{current_user.name}",
     amount: 899 
   }
  end

  def create
    @amount = params[:amount]

    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken],
      plan: "premium_monthly"
      )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Blocipedia Membership - #{current_user.email}',
      currency: 'usd'
      )

    flash[:success] = "Thanks for subscribing!"
    redirect_to user_path(current_user)


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
