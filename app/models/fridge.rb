class Fridge < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :food
    validates :amount, numericality: {greater_than: 0}
    validates :unit
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 0 }
   end


   def food_amount_unit
    self.food + " " + self.amount.to_s + self.unit.to_s
  end
end
