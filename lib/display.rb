# frozen_string_literal: true


class Display
  attr_reader :price

  def display_price(barcode)
    catalogue = Catalogue.new
    set_price(catalogue.prices_by_barcode[barcode])
  end

  def unrecognised_barcode_error_message(barcode)
    set_price("Product not found for #{barcode}")
  end

  def blank_barcode
    set_price('Scanning error: empty barcode')
  end

  def zero_items
    set_price('No sale in progress. Try scanning a product.')
  end

  private

  def set_price(string)
    @price = string
  end
end
