class CashRegister

    attr_accessor :total, :discount, :cart


    def initialize(discount=0, total=0, cart=[])
        @discount = discount
        @total = total
        @cart = cart
    end

    def add_item(name, price, quantity=1)
        self.total += price * quantity
        self.cart << { name => [price, quantity]}
    end

    def apply_discount
        if self.discount != 0
            self.total -= self.total * (self.discount / 100.00)
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        cart_array = []
        self.cart.each do |transaction|
            transaction.each do |name, costs|
               costs[1].times{ cart_array << name }
            end
        end
        cart_array
    end

    def void_last_transaction
        last_transaction = self.cart[self.cart.length - 1]
        
        refund = last_transaction.values[0][0] * last_transaction.values[0][1]
        self.total -= refund       
        
        self.cart.pop
    end
end

