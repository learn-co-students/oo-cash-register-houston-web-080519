class CashRegister
    attr_accessor :discount, :last_transaction_amount, :items, :total

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end
 
    def add_item(item, price, quantity = 1)
        quantity.times do
            @items << item
        end
        @total += price * quantity
        @last_transaction_amount = price * quantity
        @total
    end

    def apply_discount
        if @discount > 0
            @discount = @discount/100.to_f
            @total = @total - (@total * (@discount))
            return "After the discount, the total comes to $#{@total.to_i}."
        end

        return "There is no discount to apply."
    end

    def apply_discount()
        if @discount > 0
          @discount = @discount/100.to_f
          @total = @total - (@total * (@discount))
          "After the discount, the total comes to $#{@total.to_i}."
        else
          "There is no discount to apply."
        end
      end

    def void_last_transaction
        @total -= @last_transaction_amount
    end
end

  