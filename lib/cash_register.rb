require "pry"

class CashRegister

attr_accessor :total,:discount,:items

  def initialize(discount=1)
    @total=0
    @discount=discount
    @items = Array.new
  end

  def apply_discount
    if self.discount>1
    self.total = (self.total.to_f * ((100-self.discount.to_f)/100)).to_i
    "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total = 0
    @items.clear
  end

  def add_item(item, price,quantity=1)
    self.total = self.total + (price * quantity)
    quantity.times {self.items.push(item) }
  end

end
