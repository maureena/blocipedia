class SubscriptionsController < ApplicationController

  def hook
    if params["type"] == "invoice.payment_succeeded"
      user = User.where(email: params["receipt_email"]).first
      user.update_attributes(:role, 'paid')
    end
   
    head :ok
  end


end