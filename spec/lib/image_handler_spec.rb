require 'pathname'
require './lib/image_handler'

RSpec.describe ImageHandler do
  describe '#width' do
    it 'returns 100 when image size is 100 (width) * 200 (height)' do
      image_path = Pathname.new('spec/fixtures/images/100_200.png')
      image_handler = described_class.new(image_path)
      expect(image_handler.width).to eq(100)
    end
  end

  describe '#height' do
    it 'returns 200 when image size is 100 (width) * 200 (height)' do
      image_path = Pathname.new('spec/fixtures/images/100_200.png')
      image_handler = described_class.new(image_path)
      expect(image_handler.height).to eq(200)
    end
  end

  describe '#pick_color' do
    it 'returns "ffffff" when a pixel is blank' do
      image_path = Pathname.new('spec/fixtures/images/100_200.png')
      image_handler = described_class.new(image_path)
      expect(image_handler.pick_color(0, 0)).to eq('ffffff')
    end

    it 'returns "eb7d46" when a pixel has [235, 125, 70]' do
      image_path = Pathname.new('spec/fixtures/images/100_200.png')
      image_handler = described_class.new(image_path)
      expect(image_handler.pick_color(95, 5)).to eq('eb7d46')
    end

    it 'returns "45eb7c" when a pixel has [69, 235, 124]' do
      image_path = Pathname.new('spec/fixtures/images/100_200.png')
      image_handler = described_class.new(image_path)
      expect(image_handler.pick_color(50, 100)).to eq('45eb7c')
    end

    it 'returns "46b4ec" when a pixel has [70, 180, 236]' do
      image_path = Pathname.new('spec/fixtures/images/100_200.png')
      image_handler = described_class.new(image_path)
      expect(image_handler.pick_color(50, 190)).to eq('46b4ec')
    end
  end
end
