require 'mini_magick'

class ImageHandler
  def initialize(image_path)
    @img = MiniMagick::Image.open(image_path)
  end

  def width
    @width ||= @img.get_pixels[0].size
  end

  def height
    @height ||= @img.get_pixels.size
  end
end
