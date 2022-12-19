# frozen_string_literal: true

require 'point_of_sale_terminal'
require 'display'
require 'sale'
require 'pry'

RSpec.describe PointOfSaleTerminal do
  describe 'it finds product and ' do
    it 'sells an item' do
      display = Display.new
      sale = Sale.new(display)

      sale.on_barcode('12345')

      expect(display.get_price).to eq '7.95'
    end

    it 'sells another item' do
      display = Display.new
      sale = Sale.new(display)

      sale.on_barcode('23456')

      expect(display.get_price).to eq '12.50'
    end
  end

  describe 'does not find product' do
    it 'and returns error' do
      display = Display.new
      sale = Sale.new(display)

      sale.on_barcode('99999')

      expect(display.get_price).to eq 'Product not found for 99999'
    end
  end
end

# total on display, text representation of price
# barcode, returns barcode e.g '343242GLD'
# last text displayed - test
# onBarcode = takes string and returns nothing (as it's an event handler)

# onbarcode = return

# DONE product found
# product not found
# empty barcode
# null barcode

# lookup table
