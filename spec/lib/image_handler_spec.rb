require 'pathname'
require './lib/image_handler'

RSpec.describe ImageHandler do
  describe '#width' do
    it 'returns 100 when image size is 100 (width) * 200 (height)' do
      image_path = Pathname.new('spec/fixtures/images/100_200.png')
      image_handler = described_class.new(image_path)
      expect(image_handler.width).to eq(100)
    end

    it 'returns 200 when image size is 100 (width) * 200 (height)' do
      image_path = Pathname.new('spec/fixtures/images/100_200.png')
      image_handler = described_class.new(image_path)
      expect(image_handler.height).to eq(200)
    end
  end
end
