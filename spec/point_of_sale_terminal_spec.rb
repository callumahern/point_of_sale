require 'point_of_sale_terminal'
require 'display'
require 'sale'
require 'pry'

RSpec.describe PointOfSaleTerminal do
  it 'sells an item' do
    display = Display.new
    sale = Sale.new
    sale.on_barcode("12345")
    expect(display.terminal).to eq "7.95"  
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
