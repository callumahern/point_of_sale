# frozen_string_literal: true

class Display
  attr_reader :text

  def display_price(price)
    set_text(price)
  end

  def unrecognised_barcode_error_message(barcode)
    set_text("Product not found for #{barcode}")
  end

  def blank_barcode
    set_text('Scanning error: empty barcode')
  end

  def display_no_sale_in_progress_message
    set_text('No sale in progress. Try scanning a product.')
  end

  def total_amount(price)
    set_text("Total: #{price}")
  end

  private

  def set_text(string)
    @text = string
  end
end
