class AuthorsController < ApplicationController
    # record not found
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    # instance not created
    rescue_from ActiveRecord::RecordInvalid, with: :render_failed_create_record


    # GET /author
    def index
        author = Author.all
        render json: author, status: :ok
    end


    # GET /author/:id
    def show
        author = find_author
        render json: author, include: :books, status: :ok
        # rescue ActiveRecord::RecordNotFound
        #     render_not_found_response

    end

    # POST /authors
    def create
        author = Author.create!(author_params)
        render json: author, status: :created
    end

    # PATCH /author/:id
    def update
        author = find_author
        author.update!(author_params)
        render json: author

        # rescue ActiveRecord::RecordNotFound
        # render_not_found_response
    end


    # DELETE /author/:id
    def destroy
        author = find_author
        author.destroy
        head :no_content
    end

    private
    def author_params
        params.permit(:firstname, :lastname, :email, :phone)
    end


    def render_not_found_response
        render json: {error: "sorry author not found"}, status: :not_found
    end
    

    def find_author
        Author.find(params[:id])
    end
    

    def render_failed_create_record(invalid)
        render json: {errors: invalid.record.errors }, status: :unprocessable_entity
    end
end


# rescue ActiveRecord::RecordNotFound
#     render json:{error: "sorry book not found"}, status: :not_found