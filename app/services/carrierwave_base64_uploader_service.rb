class CarrierwaveBase64UploaderService
  extend ActiveSupport::Concern

  def base64_conversion(uri_str, filename = 'base64')
    image_data = split_base64(uri_str)
    image_data_string = image_data

    ## FIXME
    image_data_binary = Base64.decode64(image_data_string[:data])

    temp_img_file = Tempfile.new(filename)
    temp_img_file.binmode
    temp_img_file << image_data_binary
    temp_img_file.rewind

    img_params = { filename: "#{filename}.#{image_data[:extension]}", type: image_data[:type], tempfile: temp_img_file }
    ActionDispatch::Http::UploadedFile.new(img_params)
  end

  private

    def split_base64(uri_str)
      if uri_str =~ /data:(.*?);(.*?),(.*)$/
        uri = Hash.new
        uri[:type] = Regexp.last_match(1)
        uri[:encoder] = Regexp.last_match(2)
        uri[:data] = Regexp.last_match(3)
        uri[:extension] = Regexp.last_match(1).split('/')[1]
        uri
      end
    end
end
