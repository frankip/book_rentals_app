class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        author = User.all
        render json: author, status: :ok
    end

    def show
        user = find_user
        render json: user, status: :ok
    end

    def create
        user = User.create(user_params)
        render json: user, status: :created
    end

    def update
        user = find_user
        user.update(user_params)
        render json: user, status: :ok
    end

    def destroy
        user = find_user
        user.destroy
        head :no_content
    end

    private
    def user_params
        params.permit(:first_name, :last_name, :email, :phone)
    end


    def render_not_found_response
        render json: {error: "sorry user not found"}, status: :not_found
    end
    

    def find_user
        User.find(params[:id])
    end
end
