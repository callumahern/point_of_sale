# frozen_string_literal: true

require 'point_of_sale_terminal'
require 'display'
require 'sale'
require 'pry'
require 'catalogue'

RSpec.describe PointOfSaleTerminal do
  let(:display) { Display.new }
  let(:sale) { Sale.new(display) }

  describe 'zero items' do
    it 'no sale in progress.' do
      sale.on_total
      expect(display.text).to eq 'No sale in progress. Try scanning a product.'
    end
  end
end
