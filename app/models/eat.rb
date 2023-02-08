class Eat < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :image
    validates :date
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 0 }
  end
end
