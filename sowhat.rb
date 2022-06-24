require './lib/image_handler'
require './lib/excel_generator'
require 'pathname'
require 'securerandom'

image_handler = ImageHandler.new(ARGV[0])
excel_generator = ExcelGenerator.new(image_handler)
file_name = Pathname.new("tmp/#{SecureRandom.hex}.xlsx")
excel_generator.fill_cells
excel_generator.generate(file_name)
puts "Created: #{file_name}"
