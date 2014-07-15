class SubscriptionsController < ApplicationController

  def hook
    debugger
    # Retrieve the request's body and parse it as JSON
    # event_json = JSON.parse(request.body.read) if request.body.read

    # Verify the event by fetching it from Stripe
    # event = Stripe::Event.retrieve(event_json["id"]) if event_json["id"]
    # Do something with event
    # no current_user available within hook, maybe user email
    puts 'hi'
    head :ok
  end


end