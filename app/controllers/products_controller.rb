class ProductsController < ApplicationController

  def index
    if params[:search_text].present?
      @products = Product.search(params[:search_text])
    else
      @products = Product.all
    end

    cart = Cart.find_by id: session[:cart_id]
    if cart.nil?
      cart = Cart.create
      session[:cart_id] = cart.id
    end
    @cart = Cart.find session[:cart_id]
  end


  def show
    @product = Product.find params[:id]
    @cart = Cart.find session[:cart_id]

    if params[:search_text].present? do
      @products = Product.search(params[:search_text])
    end
    end
  end

  def info
    @cart = Cart.find session[:cart_id]
  end

end
