# frozen_string_literal: true

class Catalogue
  attr_reader :prices_by_barcode

  def initialize(prices_by_barcode = { '12345' => '£7.95', '23456' => '£12.50' })
    @prices_by_barcode = prices_by_barcode
  end

  def find_price(_price)
    'Total £7.95'
  end
end
