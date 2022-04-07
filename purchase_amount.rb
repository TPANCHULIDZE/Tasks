# Purchase amount

class Purchase
  def initialize
    @purchase_hash = {}
    @amount_hash = {}
  end
  
  def create_purchase
    loop do 
      puts "Enter product name. If you want end, please enter stop"
      name = gets.chomp
      if name == "stop"
        break
      end
      puts "Enter product price"
      price = gets.chomp.to_f
      puts "Enter product quantity"
      quantity = gets.chomp.to_f

      @purchase_hash[name] = {price: price, quantity: quantity}
    end
  end

  def create_amount
    @purchase_hash.each do |key, value| 
      @amount_hash[key] = value[:price] * value[:quantity]
    end
  end

  def back_amount
    @amount_hash
  end

  def back_all_amount
    @amount_hash.values.sum
  end
end

prc = Purchase.new


prc.create_purchase
prc.create_amount
prc.back_amount.each { |key, value| puts "#{key} total amount is #{value}"}
puts "total amount of all product is #{prc.back_all_amount}"


