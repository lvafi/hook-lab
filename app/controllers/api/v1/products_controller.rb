class Api::V1::ProductsController < Api::ApplicationController
    before_action :authenticate_user!, only: [:create]
  def index
    products = Product.order(created_at: :desc)
    render json: products
  end

  def show
    product = Product.find params[:id]
    render json: product
  end

  def create
    product = Product.new product_params
    product.user = current_user
    if product.save
      render json: { id: product.id }
    else
      head :conflict
    end
  end

  private

  def product_params
    byebug
    params.require(:product).permit(:title, :description, :price)
  end
end
