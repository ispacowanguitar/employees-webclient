class Product

  attr_accessor :name, :color, :description, :id

  def initialize(input_hash)
    @name = input_hash["name"]
    @color = input_hash["color"]
    @description = input_hash["description"]
    @id = input_hash["id"]
  end

  def reverse_name
    @name.reverse.downcase.capitalize
  end

  def self.find_by(attribute_hash)
    id = attribute_hash[:id]
    product_hash = Unirest.get("#{ENV['API_BASE_URL']}/products/#{id}.json").body
    Product.new(product_hash)
  end

  def self.all

    @products = []
    product_array = Unirest.get("#{ENV['API_BASE_URL']}/products.json").body
    product_array.each do |product|
      @products << Product.new(product)
    end

    @products
  end

  def destroy
    Unirest.get("#{ENV['API_BASE_URL']}/products/#{id}.json")
  end

  def self.create(parameters)
    product_hash = Unirest.post("#{ENV['API_BASE_URL']}/products.json",
          headers: { "Accept" => "application/json" },
          parameters: parameters 
          ).body
    Product.new(product_hash)
  end
end