# frozen_string_literal: true

class Display

  def get_price
    @price
  end

  def set_price(string)
    @price = string
  end

  def display_price(barcode)
    @display.set_price(@prices_by_barcode[barcode])
  end

  def display_product_not_found_message(barcode)
    @display.set_price("Product not found for #{barcode}")
  end

  def display_empty_barcode_message
    @display.set_price('Scanning error: empty barcode')
  end
end
