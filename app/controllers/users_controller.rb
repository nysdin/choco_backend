class UsersController < ApplicationController
  skip_before_action :check_login, only: [:create]

  def create
    @currnt_user = User.create_or_find_by(
      email: @payload['email'],
      name: @payload['name'],
      image: @payload['picture']
    )

    render json: @current_user, status: :ok
  end
end
