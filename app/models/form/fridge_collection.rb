class Form::FridgeCollection < Form::Base
  FORM_COUNT = 1
  attr_accessor :fridges, :user_id, :eats

  def initialize(attributes = {})
    super attributes
    self.fridges = FORM_COUNT.times.map { Fridge.new() } unless self.fridges.present?
  end
  
  def fridges_attributes=(attributes)
    self.fridges = attributes.map { |_, v| Fridge.new(v) }
  end

  def save
    Fridge.transaction do
      self.fridges.map do |fridge|
        if fridge.food.present?
          fridge["user_id"] = user_id
          fridge.save!
        end
      end
    end
      return true
    rescue => e
      return false
  end

  def update
    Fridge.transaction do
      self.fridges.map do |fridge|
        if fridge.id.present?
          before_fridge = Fridge.find(fridge.id)
          after_amount = before_fridge.amount - fridge.amount
          if after_amount == 0
            before_fridge.destroy!
          else
            after_price = (before_fridge.price / before_fridge.amount * after_amount).floor
            before_fridge.update!(amount: after_amount, price: after_price)
          end
        end
      end
    end
    rescue => e
      return render :new
  end
end