class BooksController < ApplicationController
    def index
        author = Book.all
        render json: author, status: :ok
    end

    def show
        book = Book.find_by(id: params[:id])
        if book
            render json: book, status: :ok
        else
            render json: {error: "sorry book not found"}, status: :not_found
        end
    end

    def create
        author = Book.create(book_params)
        render json: author, status: :created
    end

    private
    def book_params
        params.permit(:title, :description)
    end
end
