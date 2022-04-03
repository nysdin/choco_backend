class ApplicationController < ActionController::API
  before_action :create_request_payload
  before_action :check_login

  rescue_from Google::Auth::IDTokens::SignatureError, with: :handle_google_auth_error
  rescue_from LoadError, with: :handle_load_error

  ## MEMO: Rest用の認証チェック
  def create_request_payload
    token = request.headers[:Authorization]
    @payload = Google::Auth::IDTokens.verify_oidc(
      token,
      aud: ENV['GOOGLE_AUTH_CLIENT_ID']
    )
  end

  def current_user(email:)
    @current_user ||= UserServices::PrepareLoginUserService.new(email: email).execute
  end

  def check_login
    current_user(email: @payload['email'])
    return if @current_user

    render json: { error: { message: '認証がされていません。' } }, status: :unauthorized
  end

  def handle_google_auth_error
    render json: { error: { message: '不正なトークンです。' } }, status: :unauthorized
  end

  def handle_load_error
    puts 'loaderror発生'
    ## TODO: loaderror発生時の対応処理を検討
  end
end
