class CartItem < ApplicationRecord

  has_one_attached :items
  belongs_to :customer

end
