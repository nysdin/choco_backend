class UsersController < ApplicationController
  skip_before_action :check_login, only: [:create]

  def create
    @currnt_user = User.create_or_find_by(
      email: @payload['email'],
      name: @payload['name']
    )

    render json: user, status: :ok
  end
end
