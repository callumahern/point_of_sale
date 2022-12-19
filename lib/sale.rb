class Sale
  attr_accessor :display

  def initialize(display)
    self.display = display
  end

  def on_barcode(string)
    if string == '12345'
      display.set_price('7.95')
    else 
      display.set_price('12.50')
    end
  end
end