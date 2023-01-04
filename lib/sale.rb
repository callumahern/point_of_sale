# frozen_string_literal: true

class Sale
  def initialize(display = Display.new, catalogue = Catalogue.new)
    @display = display
    @catalogue = catalogue
  end

  def on_barcode(barcode)
    return @display.blank_barcode if barcode == ''

    if has_barcode?(barcode)
      @display.display_price(barcode)
    else
      @display.unrecognised_barcode_error_message(barcode)
    end
  end

  private

  def has_barcode?(barcode)
    @catalogue.prices_by_barcode[barcode]
  end
end
