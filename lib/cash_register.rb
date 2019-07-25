class CashRegister

    attr_reader :items, :discount
    attr_accessor :total, :price

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    # Here, I am initializing with just a discount, per the test, setting it to 0.
    # Items is also initialized. I could not make items a class variable, as it
    # didn't pass the test. Why? Because it wouldn't be an instance variable, it
    # would be a class variable available for the whole CashRegister class - which
    # means it would hold ALL items from ALL instances. @@ should mostly just be
    # used when I need to store all instances of a class. Avoid otherwise!!

    def add_item(item, price, quantity = 1)
        @price = price
        @total += price * quantity
        @items.fill(item, @items.size, quantity)
    end

    # With add_item, we are instantiating price for the first time. We are able
    # instantiate price in any method within the class. This way, I am able to use
    # @price anywhere in my class. It doesn't necissarily have to be declared in
    # the initialze method. It's all context-based... for instance, would I need a 
    # price set on the total? Probably not, but I definitely would for the items.

    def apply_discount
        if discount == 0
            return "There is no discount to apply."
        else
            @total -= ((@total * @discount) / 100)
            return "After the discount, the total comes to $#{@total}."
        end
    end

    # for apply discount, I have to make sure it is only able to be executed whe
    # the discount exists, ie, is greater than 0. That's why everything is set i
    # a conditional. I had discount <=0, but discounts cannot be negative.

    def void_last_transaction
        @total -= @price
    end

    # This method is only possible because I instantiated price in the add_it
    # method. @price here represents the price of the latest item(s) to be 
    # added to the items array ("cart"), and in this case it's an INSTANCE price.
    # The INSTANCE price has to be made available, so it needs to be instantiated!
    # This can be done in any instance method, not in any class method/class var.
end
