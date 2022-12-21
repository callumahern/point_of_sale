# frozen_string_literal: true

class Sale
  def initialize(display, catalogue = { '12345' => '£7.95', '23456' => '£12.50' })
    @display = display
    @prices_by_barcode = catalogue
  end

  def on_barcode(barcode)
    return blank_barcode if barcode == ''

    if has_barcode?(barcode)
      display_price(barcode)
    else
      unrecognised_barcode(barcode)
    end
  end

  private

  def has_barcode?(barcode)
    @prices_by_barcode[barcode]
  end

  def display_price(barcode)
    @display.set_price(@prices_by_barcode[barcode])
  end

  def unrecognised_barcode(barcode)
    @display.set_price("Product not found for #{barcode}")
  end

  def blank_barcode
    @display.set_price('Scanning error: empty barcode')
  end
end
