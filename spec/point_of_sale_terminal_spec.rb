require 'point_of_sale_terminal'
require 'display'
require 'sale'
require 'pry'

RSpec.describe PointOfSaleTerminal do
  it 'sells an item' do
    display = Display.new
    sale = Sale.new
    sale.on_barcode("12345")
    expect(display.text).to eq "7.95"  
  end

  xit 'sells another product but fails' do
    display = Display.new
    sale = Sale.new
    display.text = "12.50"
    sale.on_barcode("23456")
    expect(display.text).to eq "12.50"
  end
end




# total on display, text representation of price 
# barcode, returns barcode e.g '343242GLD'
# last text displayed - test
# onBarcode = takes string and returns nothing (as it's an event handler)

# onbarcode = return 

# product found
# product not found
# empty barcode
# null barcode
