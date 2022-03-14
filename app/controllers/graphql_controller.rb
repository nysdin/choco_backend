class GraphqlController < ApplicationController
  skip_before_action :create_request_payload
  skip_before_action :check_login
  before_action :prepare_graphql_auth_instance_variables

  def execute
    variables = App::PrepareGraphqlVariablesParamService.new(params[:variables]).execute
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      current_user: @current_user,
      isApollo: request.query_parameters[:apollo] == 'true'
    }

    result = ChocoSchema.execute(
      query,
      variables: variables,
      context: context,
      operation_name: operation_name
    )

    render json: result
  rescue => e
    raise e unless Rails.env.development?

    handle_error_in_development(e)
  end

  private

    def prepare_graphql_auth_instance_variables
      id_token = request.headers[:authorization]
      @payload = App::VerifyGoogleAuthTokenService.new(id_token).execute
      return if @payload.blank?

      @current_user ||= Users::PrepareLoginUserService.new(email: @payload['email']).execute
    end

    def handle_error_in_development(e)
      logger.error e.message
      logger.error e.backtrace.join("\n")

      render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: :internal_server_error
    end
end
