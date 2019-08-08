require 'pry'
class CashRegister

    attr_accessor :total, :discount, :price, :last_transaction
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @cart = []
        @price = price
        @last_transaction = nil
    end

    def add_item(title, price, quantity=0)
        if quantity == 0
            @total = total + price
            @cart.push(title)
            @last_transaction = price
        else
            @total += quantity * price
            counter = 0
            while counter < quantity
                @cart.push(title)
                counter += 1
            end
            @last_transaction = price * quantity

        end
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        else
             @total = @total -= (@discount*10)
            return "After the discount, the total comes to $#{@total}."
        end

    end

    def items
        return @cart
    end

    def void_last_transaction
        @cart.pop
        @total -= @last_transaction
    end
        
end

cart = CashRegister.new

cart.add_item("egg", 20, 1)

cart.add_item("tomato", 10, 1)

cart.add_item("tomato", 3, 2)

cart.add_item("tomato", 4, 1)


