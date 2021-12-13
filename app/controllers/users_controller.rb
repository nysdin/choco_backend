class UsersController < ApplicationController
  def create
    user = User.find_by(email: @payload['email'])
    return render json: user, status: :ok if user

    user = User.create!(email: @payload['email'], name: @payload['name'])
    render json: user, status: :ok
  end
end
