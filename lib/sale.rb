# frozen_string_literal: true

class Sale
  def initialize(display, catalogue = { '12345' => '£7.95', '23456' => '£12.50' })
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

  def has_barcode(barcode)
    @prices_by_barcode[barcode]
  end
end
