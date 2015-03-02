class Api::ProductsController < ApplicationController

  protect_from_forgery with: :null_session

  def index
    @products = Product.all
    render json: @products
  end

  def show
    @product = Product.find params[:id]
    render json: @product
  end

  def create
    @product = Product.new params.require(:product).permit(:name, :price, :description, :remote_photo_url)
    if @product.save
      render json: @product
    else
      render json: @product.errors, status: 422
    end
  end

  def update
    @product = Product.find params[:id]
    @product.update params.require(:product).permit(:name, :price, :description, :remote_photo_url)
    if @product.save
      render json: @product
    else
      render json: @product.errors, status: 422
    end
  end

end
