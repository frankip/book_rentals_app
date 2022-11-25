class BooksController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        author = Book.all
        render json: author, status: :ok
    end

    def show
        book = find_book
        render json: book, status: :ok
    end

    def create
        book = Book.create(book_params)
        render json: book, status: :created
    end

    def update
        book = find_book
        book.update(book_params)
        render json: book, status: :ok
    end

    def destroy
        book = find_book
        book.destroy
        head :no_content
    end

    private
    def book_params
        params.permit(:title, :description)
    end

    def render_not_found_response
        render json: {error: "sorry book not found"}, status: :not_found
    end
    

    def find_book
        Book.find(params[:id])
    end
end
