class Form::FridgeCollection < Form::Base
  FORM_COUNT = 1
  attr_accessor :fridges, :user_id

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
        fridge["user_id"] = user_id
        fridge.save
      end
    end
      return true
    rescue => e
      return false
  end
end