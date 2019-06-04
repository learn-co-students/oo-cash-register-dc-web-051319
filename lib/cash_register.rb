class CashRegister
  attr_reader :discount
  attr_accessor :total

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction
  end

  def add_item(title, price, quantity=1)
    @total = @total + price*quantity
    quantity.times{
      @items << title
    }
    @last_transaction = {title: title, price: price, quantity: quantity}
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    end
    @total = @total-(@discount/100.0 * @total)
    "After the discount, the total comes to $#{@total.to_i}."
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @last_transaction[:price] * @last_transaction[:quantity]
  end
end
