# app/controllers/admin/orders_controller.rb
module Admin
    class OrdersController < ApplicationController
      before_action :authenticate_admin!
      before_action :set_order, only: [:show, :edit, :update]
  
      def index
        @orders = Order.recent
      end
  
      def show
      end
  
      def edit
      end
  
      def update
        if @order.update(order_params)
          redirect_to admin_orders_path, notice: 'Order status updated successfully.'
        else
          render :edit
        end
      end
  
      private
  
      def set_order
        @order = Order.find(params[:id])
      end
  
      def order_params
        params.require(:order).permit(:status)
      end
  
      def authenticate_admin!
        unless current_user&.admin?
          redirect_to root_path, alert: 'Not authorized'
        end
      end
    end
  end