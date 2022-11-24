class UsersController < ApplicationController
    def index

        author = User.all
        render json: author, status: :ok
    end

    def show
        user = User.find_by(id: params[:id])
        if user
            render json: user, status: :ok
        else
            render json: {error: "sorry user not found"}, status: :not_found
        end
    end

    def create
        author = User.create(user_params)
        render json: author, status: :created
    end
    private

    def user_params
        params.permit(:first_name, :last_name, :email, :phone)
    end
end
