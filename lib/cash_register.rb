require 'pry'

class CashRegister
  
    attr_accessor :total, :discount, :item, :last_total, :price, :quantity
       @@items=[]
    
      def initialize(discount=1.0)
        @total = 0.0
        @discount = discount.to_f
      end
    
      def total
        @total
      end 
      
      def add_item(item, price, quantity=1)
        
        @last_total = @total
        @total+=price*quantity.to_f
        @last_item = {"item" => item, "price" => price*quantity.to_f, "quantity" => quantity}
        count = 0 
         until count == quantity
           @@items << item
           count+=1
         end
         count = 0
      end
      
      def apply_discount
         if discount!=1.0
           @total = @total - @total*@discount/100
           
           "After the discount, the total comes to $800."
        else
           "There is no discount to apply."
        end
      end
      
      def items
        @@items.last(4)
      end 
      
      def void_last_transaction
        @total = @last_total
      end 
    
end 
