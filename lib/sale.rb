# frozen_string_literal: true

class Sale
  def initialize(display = Display.new, catalogue = Catalogue.new)
    @display = display
    @catalogue = catalogue
  end

  def on_barcode(barcode)
    return @display.blank_barcode if barcode == ''

    if has_barcode?(barcode)
      price = @catalogue.find_price(barcode)
      @display.display_price(price)
    else
      @display.unrecognised_barcode_error_message(barcode)
    end
  end

  def on_total
    @display.display_no_sale_in_progress_message
  end

  private

  def has_barcode?(barcode)
    @catalogue.find_price(barcode)
  end
end
