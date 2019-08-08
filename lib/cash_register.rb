class CashRegister
    attr_accessor :total, :discount, :last_transaction_p
    def initialize (discount = 0)
        @total = 0
        @discount = discount
        @cart = []
        @last_transaction_p = nil
        
    end

   
 

    def apply_discount 
        if @discount == 0
            "There is no discount to apply."
        else
            @total = @total -= (@discount*10)
            return "After the discount, the total comes to $#{@total}."
        end
    end
    
    def add_item(title, price, quantity = 0)
        i = 0
        item_info = {}
        item_title = title
        item_quantity = quantity
        item_price = price
        #@last_transaction_p = price
        if quantity == 0 
            @total += price
            @last_transaction_p = price
        else 
            @total += price * quantity
            @last_transaction_p = price * quantity
        end
        if quantity == 0
            @cart << title
        else
            quantity.times do 
                @cart << title
            end
        end

    end
    
    def items
        @cart

    end

    def void_last_transaction
        last_item = @cart.pop
        @total -= @last_transaction_p
        return @total.to_f
        puts @total.to_f
    end
     
end
