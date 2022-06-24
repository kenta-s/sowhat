require 'rubyXL'
require 'rubyXL/convenience_methods'

class ExcelGenerator
  attr_reader :worksheet

  COLUMN_WIDTH = 2.0

  def initialize(image_handler)
    @image_handler = image_handler
    @workbook = RubyXL::Workbook.new
    @worksheet = @workbook.worksheets[0]

    add_cells
    resize_column_width
  end

  def fill_cells
    @image_handler.width.times do |i|
      @image_handler.height.times do |j|
        color = @image_handler.pick_color(i, j)
        worksheet.sheet_data[i][j].change_fill(color)
      end
    end
  end

  def generate(filename)
    @workbook.write(filename)
  end

  private

  def add_cells
    # creating necessary cells to display an image
    @image_handler.width.times do |i|
      @image_handler.height.times do |j|
        @worksheet.add_cell(i, j, '')
      end
    end
  end

  def resize_column_width
    @image_handler.width.times do |i|
      @worksheet.change_column_width(i, COLUMN_WIDTH)
    end
  end
end
