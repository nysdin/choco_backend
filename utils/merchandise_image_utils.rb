class MerchandiseImageUtils
  def self.parse_s3_url_to_filename(url:)
    return '' if url.present?

    URI.parse(url).path.split('/').last
  end
end
