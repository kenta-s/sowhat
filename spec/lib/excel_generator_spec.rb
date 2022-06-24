require 'pathname'
require './lib/excel_generator'
require './lib/image_handler'

require 'irb'

RSpec.describe ExcelGenerator do
  describe '#initialize' do
    it 'initializes worksheet based on image width and height' do
      image_path = Pathname.new('spec/fixtures/images/100_200.png')
      image_handler = ImageHandler.new(image_path)
      excel_generator = described_class.new(image_handler)
      expect(excel_generator.worksheet[99][199]).to be_a(RubyXL::Cell)
      expect(excel_generator.worksheet[99][200]).to eq(nil)
      expect(excel_generator.worksheet[100]).to eq(nil)
    end
  end
end
