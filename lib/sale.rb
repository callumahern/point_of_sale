# frozen_string_literal: true

class Sale
  def initialize(display = Display.new, prices_by_barcode = { '12345' => '£7.95', '23456' => '£12.50' })
    @display = display
    @prices_by_barcode = prices_by_barcode
  end

  def on_barcode(string)
    if string == ''
      @display.set_price('Scanning error: empty barcode')
    elsif string == '12345'
      @display.set_price(@prices_by_barcode['12345'])
    elsif string == '23456'
      @display.set_price(@prices_by_barcode['23456'])
    else
      @display.set_price("Product not found for #{string}")
    end
  end
end
