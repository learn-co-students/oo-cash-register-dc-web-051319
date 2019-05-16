class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount=0) #put discount here because it is automaticall set to 0
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1) #needs to add quantity to automatically be accepted to 1
    self.total += price * quantity
    quantity.times do
      items << title
    end
    self.last_transaction = price * quantity
  end


  def apply_discount
    if discount > 0
      #new total = original price - discount rate
      #discount rate
      #convert the discount rate into percentage
      # discount rate * 100 / original price

      #new total after discount = original price - (discount rate * 100 / original price)
      self.total = (total * ((100.0 - discount.to_f)/100)).to_i #tried a lot to solve this w/o this formula. however, you need
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total = self.total - self.last_transaction
  end


end
