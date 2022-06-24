require 'mini_magick'

class ImageHandler
  def initialize(image_path)
    @img = MiniMagick::Image.open(image_path)
    @pixels = @img.get_pixels
  end

  def width
    @width ||= @pixels[0].size
  end

  def height
    @height ||= @pixels.size
  end

  def pick_color(i, j)
    rgb = @pixels[i][j].map do |color|
      c = color.to_s(16)
      c.length == 1 ? "0#{c}" : c
    end.join
  end
end
