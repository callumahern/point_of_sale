# frozen_string_literal: true

class Sale
  def initialize(display = Display.new, catalogue = Catalogue.new)
    @display = display
    @catalogue = catalogue
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
    @catalogue.prices_by_barcode[barcode]
  end

  def display_price(barcode)
    @display.set_price(@catalogue.prices_by_barcode[barcode])
  end

  def unrecognised_barcode(barcode)
    @display.set_price("Product not found for #{barcode}")
  end

  def blank_barcode
    @display.set_price('Scanning error: empty barcode')
  end
end
