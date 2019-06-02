class CashRegister
    attr_accessor :discount, :total, :last_transaction, :items

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        self.total += price * quantity
        quantity.times do
            items << title
        end
        @last_transaction = total
    end

    def apply_discount
        if discount != 0
            @discount = (total * discount/100).floor(2)
            self.total -= discount
            return "After the discount, the total comes to $#{total}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total -= last_transaction
    end
end