class ApplicationController < ActionController::API
  before_action :create_request_payload
  before_action :check_login

  def create_request_payload
    token = request.query_parameters[:token]
    @payload = Google::Auth::IDTokens.verify_oidc(
      token,
      aud: ENV['GOOGLE_AUTH_CLIENT_ID']
    )
  end

  def check_login
    ## 既存のデータにUserが存在するか確認する。
    ## 存在すればreturn
    ## 存在しなければログインしていないとみなし、エラー返す。
    p @payload['email']
    p @payload['name']
  end
end
