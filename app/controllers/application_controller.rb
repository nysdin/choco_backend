class ApplicationController < ActionController::API
  before_action :create_request_payload
  before_action :check_login

  rescue_from Google::Auth::IDTokens::SignatureError, with: :handle_google_auth_error

  ## MEMO: Rest用の認証チェック
  def create_request_payload
    token = request.headers[:Authorization]
    @payload = Google::Auth::IDTokens.verify_oidc(
      token,
      aud: ENV['GOOGLE_AUTH_CLIENT_ID']
    )
  end

  def check_login
    @current_user ||= User.find_by(email: @payload['email'])
    return if @current_user

    render json: { error: { message: '認証がされていません。' } }, status: :unauthorized
  end

  def handle_google_auth_error
    render json: { error: { message: '不正なトークンです。' } }, status: :unauthorized
  end
end
