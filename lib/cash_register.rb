require "pry"
class CashRegister
  attr_accessor :total, :discount, :item
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @total_cart =[]
    @transaction =[]

  end

  def add_item(item, price, quanity=1 )
    total_cost=price*quanity
    @total += total_cost
    counter=quanity
    if quanity > 1
      #add to cart x times
      while (counter != 0)
        @total_cart << item
        @transaction << price
        counter-=1
      end
    elsif quanity ==1
      @total_cart << item
      @transaction << price


    end

  end

  def apply_discount
    if discount > 0
      discount_into_decimal = (discount/100.to_f)
      cost_with_discount = total*(1-discount_into_decimal)
      @total = cost_with_discount.to_i
      total = @total
      return "After the discount, the total comes to $#{total}."
    else
      return "There is no discount to apply."
    end
  end

  def items

    return @total_cart
  end

  def void_last_transaction
    self.total = @total - @transaction.pop
  end
end
