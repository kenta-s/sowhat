require 'rubyXL'

class ExcelGenerator
  attr_reader :worksheet

  def initialize(image_handler)
    @image_handler = image_handler
    workbook = RubyXL::Workbook.new
    @worksheet = workbook.worksheets[0]

    add_cells
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
end
