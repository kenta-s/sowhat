# What's this?

sowhat converts an image file into an excel file.

Input image:  
![rubiks](https://github.com/kenta-s/sowhat/blob/master/spec/fixtures/images/rubiks.png)

Output (Excel file):  
![rubiks excel](https://github.com/kenta-s/sowhat/blob/master/spec/fixtures/images/rubiks_excel.png)

Each cell represents a pixel of the image.  
![rubiks excel](https://github.com/kenta-s/sowhat/blob/master/spec/fixtures/images/rubiks_excel2.png)

## Usage

1. clone this repository and `bundle install`.
2. `bundle exec ruby sowhat path/to/image_file` 
3. you should see an excel file in tmp dir

This may take a few minutes (or even hours. It depends on the image size and machine spec) to finish. I recommend you try this with a tiny image like 30 * 30 for the first time.
