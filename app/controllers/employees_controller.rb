class EmployeesController < ApplicationController
  
  def index
    # @products = []
    # product_array = Unirest.get("http://localhost:3000/products.json").body
    # product_array.each do |product|
    #   @products << Product.new(product)
    # end

    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def new
  end
  
  def create
    # @product = Unirest.post(
    #   "http://localhost:3000/products.json",
    #   headers: { "Accept" => "application/json" },
    #   parameters: {
    #     name: params[:name],
    #     color: params[:color],
    #     description: params[:description]
    #   }
    # ).body
    # product_id = @product['id']

    @product = Product.create(
      name: params[:name],
      color: params[:color],
      description: params[:description]
      )    
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    redirect_to "index"
  end

end
