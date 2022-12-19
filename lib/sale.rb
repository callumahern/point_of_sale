class Sale

  def initialize(display = Display.new)
    @display = display
  end

  def on_barcode(string)
    if string == '12345'
      @display.set_price('7.95')
    elsif string == '23456' 
      @display.set_price('12.50')
    end
  end
end