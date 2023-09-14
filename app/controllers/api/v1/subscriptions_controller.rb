module Api 
  module V1
    class SubscriptionsController < ApplicationController 
      
      def index 
        customer = Customer.find(params[:customer_id])
        subscriptions = customer.subscriptions
        render json: SubscriptionSerializer.new(subscriptions), status: 200
      end

      def create 
        subscription = Subscription.new(subscription_params)
        if subscription.save 
          render json: SubscriptionSerializer.new(subscription), status: :created
        else  
          render json: subscription.errors, status: :unprocessable_entity
        end
      end

      def update 
        subscription = Subscription.find(params[:id])
        subscription.update(status: "deactivated")
        render json: SubscriptionSerializer.new(subscription)
      end

      private 

      def subscription_params 
        params.require(:subscription).permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
      end
    end
  end
end