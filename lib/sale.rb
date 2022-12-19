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
    end
  end
end
