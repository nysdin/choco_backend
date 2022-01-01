module Types
  class DividedDepartmentType < Types::BaseObject
    field :id, ID, null: false
    field :department, Types::DepartmentType, null: false
  end
end
