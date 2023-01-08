class Review < ApplicationRecord
  has_one_attached :image

  belongs_to :home_appliance
  belongs_to :customer
  belongs_to :genre

  validates :review_title, presence: true
  validates :score, presence: true
  validates :review_contents, presence: true

  def get_image
    unless image.attached?
      file_path = Ralis.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', cotent_type: 'image/jpeg')
    end
    image
  end

end
