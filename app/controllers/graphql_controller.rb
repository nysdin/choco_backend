class GraphqlController < ApplicationController
  skip_before_action :create_request_payload
  skip_before_action :check_login
  before_action :graphql_auth

  def execute
    variables = prepare_variables(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      current_user: @current_user,
      isApollo: request.query_parameters[:apollo] == 'true'
    }

    result = ChocoSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue => e
    raise e unless Rails.env.development?

    handle_error_in_development(e)
  end

  private

    def graphql_auth
      token = request.headers[:authorization]

      begin
        @payload = Google::Auth::IDTokens.verify_oidc(
          token,
          aud: ENV['GOOGLE_AUTH_CLIENT_ID']
        )
        @current_user ||= User.find_by(email: @payload['email'])
      rescue => e
        logger.debug "エラーの内容: #{e}"
        @current_user = nil
      end
    end

    # Handle variables in form data, JSON body, or a blank value
    def prepare_variables(variables_param)
      case variables_param
      when String
        if variables_param.present?
          JSON.parse(variables_param) || {}
        else
          {}
        end
      when Hash
        variables_param
      when ActionController::Parameters
        variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
      when nil
        {}
      else
        raise ArgumentError, "Unexpected parameter: #{variables_param}"
      end
    end

    def handle_error_in_development(e)
      logger.error e.message
      logger.error e.backtrace.join("\n")

      render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: :internal_server_error
    end
end
