class ShoppingCart
  attr_reader :name, :capacity, :products, :details, :total_number_of_products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
    @details = Hash.new
    @details[:name] = name
    @details[:capacity] = capacity.delete_suffix("items").to_i
    # @total_number_of_products = products.count {|product| product.quantity}
  end

  def add_product(product)
    @products << product
  end

  def total_number_of_products
    array = []
    counter = 0
    @products.each do |product|
      array << product.quantity
    end
    array.sum
  end

  def is_full?
    @details[:capacity] < total_number_of_products
  end

  def products_by_category(category)
    @products.find_all do |product|
      product.category == category
    end
  end

  def percentage_occupied
    ((total_number_of_products)/(@details[:capacity].to_f)*100).round(2)
  end

  def sorted_products_by_quantity
    @products.sort_by do |product|
      -product.quantity
    end
  end

  def product_breakdown
    @products.group_by do |product|
      product.category
    end
  end

end
