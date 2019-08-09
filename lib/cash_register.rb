require 'pry'
class CashRegister
  
  attr_accessor :total, :discount, :cart, :item, :item_price, :price, :last_item_price
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart = []
    @item_price = []
  end
  
  def add_item(item, price, quantity = 0)
    @item = item
    @price = price
    @last_item_price = 0
    if quantity == 0 
      self.total = self.total + price
      self.cart.push(item)
      self.item_price.push(price)
      self.last_item_price = price
    else
      price = price * quantity
      self.last_item_price = price
      self.total = self.total + price
      while self.cart.length <= quantity do
        self.cart.push(item)
        self.item_price.push(price)
      end
    end
  end
  
  def apply_discount
    if self.discount == 0
      return "There is no discount to apply."
    else
      discount = (self.discount * 0.01)
      discount_total = self.total * discount
      self.total = self.total - discount_total
      return "After the discount, the total comes to $#{self.total.round}."
    end
    return self.total
  end
  
  def items
    item_array = self.cart
    return item_array
  end
  
  def void_last_transaction
    self.total = self.total - self.last_item_price
  end
end




