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
    it 'returns error' do
      sale.on_total
      expect(display.text).to eq 'No sale in progress. Try scanning a product.'
    end
  end

  describe 'when given one item' do
    let(:catalogue) { Catalogue.new }

    it 'does something' do
      catalogue.find_price(1)
      sale.on_total
      expect(display.text).to eq 'Total: £7.95'
    end
  end
end
