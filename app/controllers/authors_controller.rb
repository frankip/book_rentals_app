class AuthorsController < ApplicationController

    def index
        author = Author.all
        render json: author, status: :ok
    end

    def show
        author = Author.find_by(id: params[:id])
        if author
            render json: author, status: :ok
        else
            render json: {error: "sorry book not found"}, status: :not_found
        end

    end

    def create
        author = Author.create(author_params)
        render json: author, status: :created
    end

    private
    def author_params
        params.permit(:firstname, :lastname, :email, :phone)
    end
end
