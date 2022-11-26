class Review < ApplicationRecord
  has_many :comments
  belongs_to :customer
  has_one_attached :image

  def get_image
    unless image.attached?
      file_path = Ralis.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', cotent_type: 'image/jpeg')
    end
    image
  end

end
