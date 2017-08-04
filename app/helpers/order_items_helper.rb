module OrderItemsHelper
  def increment(item)
    p item
    p item
    p item
    p item
    p item
    p item
    p item
    p item
    p item
    p item
    p item
    p item
    item < 99 ? item += 1 : 99
  end

  def decrement(item)
    item.to_i > 1 ? item.to_i -= 1 : 1  
  end

end