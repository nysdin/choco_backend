namespace :tasks do
  desc '全てのテーブルのデータを一括で削除したいときに使います。'
  task delete_all_data: :environment do
    ## TODO: ここでのマスタデータの削除は控えます
    DividedDepartment.delete_all
    Merchandise.delete_all
    User.delete_all
  end
end