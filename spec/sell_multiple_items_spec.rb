# frozen_string_literal: true

require 'point_of_sale_terminal'
require 'display'
require 'sale'
require 'pry'
require 'catalogue'

RSpec.describe PointOfSaleTerminal do
  let(:display) { Display.new }
  let(:sale) { Sale.new(display) }

  describe 'when given zero items' do
    it 'returns a scanning error' do
      sale.on_total
      expect(display.text).to eq 'No sale in progress. Try scanning a product.'
    end
  end

  describe 'when given one item' do
    let(:catalogue) { Catalogue.new }

    it 'returns total amount of order' do
      sale.on_barcode('12345')
      sale.on_total
      expect(display.text).to eq 'Total: £7.95'
    end
  end
end
