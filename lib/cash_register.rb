class CashRegister
    

    attr_accessor :total, :discount, :items, :last_item_price
    
    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        quantity.times do
            self.items.push(title)
        end
        self.total += price * quantity
        self.last_item_price = price
    end

    def apply_discount
        if self.discount
            self.total -= self.total * (self.discount * 0.01)
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_item_price
    end
end
