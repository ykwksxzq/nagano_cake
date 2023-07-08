class Item < ApplicationRecord

  has_one_attached :image

  with_options presence: true do
   validates :name
   validates :introduction
   validates :price
 end


  def add_tax_price
    (self.price * 1.10).round
  end

end
