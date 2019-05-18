require 'pry'

class CashRegister
  
    attr_accessor :total, :discount, :item, :price, :quantity  
    
      def initialize(discount=1.0)
        @total = 0.0
        @discount = discount.to_f
      end
    
      def total
        @total
      end 
      
      def add_item(item, price, quantity=1)
        @total+=price*quantity.to_f
      end
      
      def apply_discount
        binding.pry
         if discount!=1.0
           @total = @total - @total*@discount/100
           "After the discount, the total comes to $800."
        else
         "There is no discount to apply."
        end
    end
end 
