module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    def authorized?(_args = '')
      Users::ConfirmAuthorizedUserService.new(context: context).execute
    end
  end
end
