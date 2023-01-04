# frozen_string_literal: true


class Display
  attr_reader :text

  def display_price(barcode)
    catalogue = Catalogue.new
    set_text(catalogue.prices_by_barcode[barcode])
  end

  def unrecognised_barcode_error_message(barcode)
    set_text("Product not found for #{barcode}")
  end

  def blank_barcode
    set_text('Scanning error: empty barcode')
  end

  def zero_items
    set_text('No sale in progress. Try scanning a product.')
  end

  private

  def set_text(string)
    @text = string
  end
end
