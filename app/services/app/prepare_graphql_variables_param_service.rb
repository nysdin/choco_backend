module App
  class PrepareGraphqlVariablesParamService
    def initialize(variables_param)
      @variables_param = variables_param
    end

    def execute
      case @variables_param
      when String
        return JSON.parse(@variables_param) || {} if @variables_param.present?

        {}
      when Hash
        @variables_param
      when ActionController::Parameters
        # GraphQL-Ruby will validate name and type of incoming variables.
        @variables_param.to_unsafe_hash
      when nil
        {}
      else
        raise ArgumentError, "Unexpected parameter: #{@variables_param}}"
      end
    end
  end
end
