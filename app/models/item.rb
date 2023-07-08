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

   def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
