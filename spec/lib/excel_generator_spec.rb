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
      expect(excel_generator.worksheet[199][99]).to be_a(RubyXL::Cell)
      expect(excel_generator.worksheet[199][100]).to eq(nil)
      expect(excel_generator.worksheet[200]).to eq(nil)
    end

    it 'resizes column width' do
      excel_generator = described_class.new(image_handler)
      expect(excel_generator.worksheet.get_column_width(0)).to eq(ExcelGenerator::COLUMN_WIDTH)
      expect(excel_generator.worksheet.get_column_width(99)).to eq(ExcelGenerator::COLUMN_WIDTH)
    end
  end

  describe '#fill_cells' do
    it 'fills color based on given image' do
      image_path = Pathname.new('spec/fixtures/images/100_200.png')
      image_handler = ImageHandler.new(image_path)
      excel_generator = described_class.new(image_handler)
      expect{ excel_generator.fill_cells }
       .to change{ excel_generator.worksheet[10][95].fill_color }
       .from('ffffff')
       .to('ea7d46')
    end
  end

  describe '#generate' do
    let(:file) { Pathname.new('tmp/9460cdfc386e2728dfd45842500465cc.xlsx') }

    around do |example|
      File.delete(file) if FileTest.exist?(file)
      example.run
      File.delete(file) if FileTest.exist?(file)
    end

    it 'generates an excel file' do
      image_path = Pathname.new('spec/fixtures/images/100_200.png')
      image_handler = ImageHandler.new(image_path)
      excel_generator = described_class.new(image_handler)

      expect{ excel_generator.generate(file) }
       .to change{ FileTest.exist?(file) }
       .from(false)
       .to(true)
    end
  end
end
