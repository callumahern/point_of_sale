# frozen_string_literal: true

require 'point_of_sale_terminal'
require 'display'
require 'sale'
require 'pry'
require 'catalogue'

RSpec.describe PointOfSaleTerminal do
  let(:display) { Display.new }
  let(:sale) { Sale.new(display) }
  describe 'it finds product and ' do
    it 'scans an item' do
      sale.on_barcode('12345')

      expect(display.text).to eq '£7.95'
    end

    it 'scans another item' do
      sale.on_barcode('23456')

      expect(display.text).to eq '£12.50'
    end
  end

  describe 'it does not find product' do
    it 'and returns error' do
      sale.on_barcode('99999')

      expect(display.text).to eq 'Product not found for 99999'
    end

    it 'because barcode is empty' do
      sale.on_barcode('')

      expect(display.text).to eq 'Scanning error: empty barcode'
    end
  end
end

# total on display, text representation of price
# barcode, returns barcode e.g '343242GLD'
# last text displayed - test
# onBarcode = takes string and returns nothing (as it's an event handler)

# onbarcode = return

# DONE product found
# DONE product not found
# DONE empty barcode
# null barcode

#  duplicate tests
# DONElookup table
