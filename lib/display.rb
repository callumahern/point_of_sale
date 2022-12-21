# frozen_string_literal: true

class Display
  attr_reader :price

  def set_price(string)
    @price = string
  end

  def display_price(barcode)
    display.set_price(@prices_by_barcode[barcode])
  end

  def unrecognised_barcode(barcode)
    display.set_price("Product not found for #{barcode}")
  end

  def blank_barcode
    display.set_price('Scanning error: empty barcode')
  end
end
