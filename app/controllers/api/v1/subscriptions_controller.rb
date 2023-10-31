class Api::V1::SubscriptionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    customer = Customer.find(params[:customer_id])
    subscriptions = customer.subscriptions
    render json: SubscriptionSerializer.new(subscriptions)    
  end

  def create
    customer = Customer.find(params[:customer_id])
    subscription = customer.subscriptions.build(subscription_params)

    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: 201
    else
      render json: { error: subscription.errors.full_messages.to_sentence }, status: 400
    end
  end

  def cancel
    customer = Customer.find(params[:customer_id])
    subscription = customer.subscriptions.find(params[:id])
    subscription.update(status: "cancelled")
    render json: SubscriptionSerializer.new(subscription)
  end

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency, :tea_id, :customer_id)
  end

  def record_not_found
    render json: { error: "Record not found" }, status: 404
  end
end