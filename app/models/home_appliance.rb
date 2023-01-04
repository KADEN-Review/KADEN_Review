class HomeAppliance < ApplicationRecord
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  belongs_to :genre

  validates :model_number, presence: true
  validates :genre_id, presence: true

  def get_image
    unless image.attached?
      file_path = Ralis.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', cotent_type: 'image/jpeg')
    end
    image
  end

  def self.search(search)
    if search
      HomeAppliance.where(["model_number like?", "%#{search}%"])
    else
      HomeAppliance.all
    end
  end
end
