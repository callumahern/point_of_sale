# frozen_string_literal: true

class Sale
  def initialize(display = Display.new, catalogue = { '12345' => '£7.95', '23456' => '£12.50' })
    @display = display
    @prices_by_barcode = catalogue
  end

  def on_barcode(barcode)
    return display_empty_barcode_message if barcode == ''

    if has_barcode(barcode)
      display_price(barcode)
    else
      display_product_not_found_message(barcode)
    end
  end

  private

  def display_empty_barcode_message
    @display.set_price('Scanning error: empty barcode')
  end

  def display_product_not_found_message(barcode)
    @display.set_price("Product not found for #{barcode}")
  end

  def display_price(barcode)
    @display.set_price(@prices_by_barcode[barcode])
  end

  def has_barcode(barcode)
    @prices_by_barcode[barcode]
  end
end
