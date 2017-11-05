class BooksController < ApplicationController
  before_action :set_author
  before_action :set_book, only: [:show, :update, :destroy]

  # GET /books
  def index
    @books = @author.books

    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = @author.books.new(book_params)

    if params[:picture]
      @picture = Picture.new(picture_params)
      @picture.imageable = @book

      if @picture.save
        render json: @book, status: :created
        return
      else
        render json: @book.errors, status: :unprocessable_entity
      end
    end

    if @book.save
        render json: @book, status: :created        
        # return
      else
        render json: @book.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /books/1
  def update
    if params[:picture]
      if @book.pictures.where(id: params[:picture][:id]).update(path: params[:picture][:path])
        render json: @book.pictures.where(id: params[:picture][:id])
        return
      else
        render json: @book.errors, status: :unprocessable_entity
      end     
    end
    if @book.update(book_params)      
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def set_author      
      @author = Author.find(params[:author_id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:title)
    end

    def picture_params
      params.require(:picture).permit(:path)
    end
  end
