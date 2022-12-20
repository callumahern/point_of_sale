# frozen_string_literal: true

class Sale
  def initialize(display = Display.new, catalogue = { '12345' => '£7.95', '23456' => '£12.50' })
    @display = display
    @prices_by_barcode = catalogue
  end

  def on_barcode(barcode)
    if barcode == ''
      @display.set_price('Scanning error: empty barcode')
      return;
    elsif @prices_by_barcode[barcode]
      @display.set_price(@prices_by_barcode[barcode])
    else
      @display.set_price("Product not found for #{barcode}")
    end
  end
end
