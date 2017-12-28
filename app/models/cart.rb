class Cart < ActiveRecord::Base

  has_many :line_items
  has_many :items, through: :line_items

  def total
    self.items.sum(:price)
  end

  def add_item(quantity)
    if item = self.line_items.find_by(item_id: quantity)
      item.quantity += 1
      item
    else
      self.line_items.build(item_id: quantity)
    end
  end
end
