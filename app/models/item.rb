class Item < ActiveRecord::Base

  has_many :line_items
  has_many :carts, through: :line_items
  belongs_to :category

  def self.available_items
    @available_items = []
    self.all.each do |i|
      if i.inventory > 0
        @available_items << i
      end
    end
      @available_items
  end
end
