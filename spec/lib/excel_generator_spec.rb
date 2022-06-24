require 'pathname'
require './lib/excel_generator'
require './lib/image_handler'

require 'irb'

RSpec.describe ExcelGenerator do
  describe '#initialize' do
    let(:image_handler) do
      image_path = Pathname.new('spec/fixtures/images/100_200.png')
      image_handler = ImageHandler.new(image_path)
    end

    it 'initializes worksheet based on image width and height' do
      excel_generator = described_class.new(image_handler)
      expect(excel_generator.worksheet[99][199]).to be_a(RubyXL::Cell)
      expect(excel_generator.worksheet[99][200]).to eq(nil)
      expect(excel_generator.worksheet[100]).to eq(nil)
    end

    it 'resizes column width' do
      excel_generator = described_class.new(image_handler)
      expect(excel_generator.worksheet.get_column_width(0)).to eq(ExcelGenerator::COLUMN_WIDTH)
      expect(excel_generator.worksheet.get_column_width(99)).to eq(ExcelGenerator::COLUMN_WIDTH)
    end
  end
end
