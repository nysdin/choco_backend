class MerchandiseImageUploader < CarrierWave::Uploader::Base
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # 保存先の決定（file => このアプリケーション, fog => Amazon S3）
  # storage :file
  storage :fog

  ## 保存先のディレクトリを決定
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # 保存するファイルの種類を設定
  def extension_whitelist
    %w(png jpg jpeg pdf gif)
  end

  # ファイル名を指定今回はアップロード日時-ファイル名に設定
  # 実際にDBに保存されるときのURLの値になる
  def filename
    "#{Time.zone.today}-#{original_filename}" if original_filename
  end
end
