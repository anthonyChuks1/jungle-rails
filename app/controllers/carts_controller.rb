class CartsController < ApplicationController

  def show
    if enhanced_cart.empty?
      redirect_to root_path
       flash[:warning] = 'Your cart is empty.'
    end
  end

  def add_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, +1)
    flash[:info] = 'Item Added to cart.'
    redirect_back fallback_location: root_path
  end

  def remove_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, -1)
    flash[:dark] = 'Item removed from cart'
    redirect_back fallback_location: root_path
  end

  private

  def modify_cart_delta(product_id, delta)
    cart[product_id] = (cart[product_id] || 0) + delta
    cart.delete(product_id) if cart[product_id] < 1
    update_cart cart
  end

end
