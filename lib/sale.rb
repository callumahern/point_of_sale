# frozen_string_literal: true

class Sale
  def initialize(display = Display.new)
    @display = display
  end

  def on_barcode(string)
    case string
    when '12345'
      @display.set_price('7.95')
    when '23456'
      @display.set_price('12.50')
    when '99999'
      @display.set_price("Product not found for #{string}")
    when ""
      @display.set_price("Scanning error: empty barcode")
    end
  end
end
