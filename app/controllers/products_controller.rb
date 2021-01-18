class ProductsController < ApplicationController
  # load_and_authorize_resource
  before_action :set_product, only: [:show, :edit, :update, :destroy]


  def index
    if params["id"]
      @products = Category.find_by_id(params["id"]).products
    else  
      @products = Product.all
    end  
  end

  def show
  end


  def new
    @product = Product.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end


  def edit
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end


  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :description, :category_id, :avatar)
    end
end
