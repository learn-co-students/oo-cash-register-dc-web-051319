class CashRegister

    attr_accessor :total, :discount, :items, :price

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity = 1)
        @price = price
        @total += price * quantity
        @items.fill(item, @items.size, quantity)
    end

    def apply_discount
        if discount <= 0
            return "There is no discount to apply."
        else
            @total -= ((@total * @discount) / 100)
            return "After the discount, the total comes to $#{@total}."
        end
    end

    def void_last_transaction
        @total -= @price
    end

end