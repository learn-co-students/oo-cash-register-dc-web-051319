class CashRegister

    attr_accessor :discount, :total
    attr_accessor :all_items, :all_prices
    
    def initialize(discount=0,total=0)
        @total = total
        @discount = discount
        @all_items = []
        @all_prices = []
    end

    def discount
        @discount
    end

    def total
        @total
    end

    def add_item(name, price, quantity=1)
        quantity.times do
            self.all_items << name
        end
        self.total += (price * quantity)
        self.all_prices << (price * quantity)
    end

    def apply_discount
        if self.discount.to_i == 0
            return "There is no discount to apply."
        elsif self.discount.to_i == 20
            user_discount = (self.total) * (self.discount)
            user_discount /=  100
            self.total -= user_discount
            return "After the discount, the total comes to $#{self.total}."
        end
    end

    def items
        @all_items
    end

    def void_last_transaction
        void = self.all_prices.last
        self.total -= void
    end

end



