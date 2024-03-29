# frozen_string_literal: true

class Catalogue
  def initialize(prices_by_barcode = { '12345' => '£7.95', '23456' => '£12.50', '55555' => '£8.50' })
    @prices_by_barcode = prices_by_barcode
  end

  def find_price(barcode)
    prices_by_barcode[barcode]
  end

  private

  attr_reader :prices_by_barcode
end
