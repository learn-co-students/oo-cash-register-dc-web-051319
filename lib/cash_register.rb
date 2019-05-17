require "pry"

class CashRegister

    attr_accessor :discount, :total, :price

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @items = []
    end

    def total
        @total
    end
    
    def add_item(title, price, quantity=1)
        @price = price
        @total += price * quantity
        quantity.times do |i|
            @items << title 
        end
    end

    def apply_discount
        if @discount
            @total -= @total * @discount / 100
            "After the discount, the total comes to $#{total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= @price
    end
    
end