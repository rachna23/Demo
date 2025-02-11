class LineItemsController < ApplicationController
  
  def create
    chosen_product = Product.find(params[:product_id])
    create_line_item(chosen_product)
  end

  def create_line_item(chosen_product)
    if @current_cart.products.include?(chosen_product)
      find_from_product(chosen_product)
    else
      create_new_product(chosen_product)
    end
    @line_item.save
    redirect_to cart_path(@current_cart, product_id: params['product_id'])
  end  

  def find_from_product(chosen_product)
    @line_item = @current_cart.line_items.find_by(product_id: chosen_product)
    @line_item.quantity += 1
  end

  def create_new_product(chosen_product)
    @line_item = LineItem.new
    @line_item.cart = @current_cart
    @line_item.product = chosen_product
  end

  def add_quantity
    @line_item = LineItem.find(params[:id])
    @line_item.quantity += 1
    @line_item.save
  end

def reduce_quantity
  @line_item = LineItem.find(params[:id])
    if @line_item.quantity > 1
      @line_item.quantity -= 1
    end
  @line_item.save
end

def destroy
  @line_item = LineItem.find(params[:id])
  @line_item.destroy
  redirect_to cart_path(@current_cart)
end

private

  def line_item_params
    params.require(:line_item).permit(:quantity,:product_id, :cart_id)
  end

end
