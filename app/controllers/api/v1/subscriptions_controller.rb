module Api 
  module V1
    class SubscriptionsController < ApplicationController 
      def create 
        subscription = Subscription.new(subscription_params)
        if subscription.save 
          render json: subscription, status: :created 
        else  
          render json: subscription.errors, status: :unprocessable_entity
        end
      end

      private 

      def subscription_params 
        params.require(:subscription).permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
      end
    end
  end
end