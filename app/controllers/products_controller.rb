class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    @product.save
  end

  def show
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end


  protected

  def product_params
    params.require(:product).permit(:name, :code, :price, :quantity)
  end

end
