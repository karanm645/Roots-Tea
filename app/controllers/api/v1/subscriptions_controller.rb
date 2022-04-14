class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.create(subscription_params)
    render json: SubscriptionSerializer.subscription_details(subscription), status: 201
    # add sad path -- 404 error if bad request
  end

  def update 
    subscription = Subscription.find(params[:id])
    subscription.update(status: "inactive")
    render json: SubscriptionSerializer.subscription_details(subscription)
  end 

  def index 
    customer_subscription = Customer.find(params[:id]).subscriptions
    render json: CustomerSubscriptionSerializer.subscription_details(customer_subscription)
  end 

  private
  
  def subscription_params
    params.permit(:tea_id, :customer_id, :title, :status, :frequency, :price)
  end
end 