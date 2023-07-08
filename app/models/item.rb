class Item < ApplicationRecord

  has_one_attached :image

  with_options presence: true do
   validates :name
   validates :introduction
   validates :price
 end

end
