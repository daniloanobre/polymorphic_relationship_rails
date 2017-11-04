class PicturesController < ApplicationController
  before_action :set_parent
  before_action :set_picture, only: [:show, :update, :destroy]

  # GET /pictures
  def index
    if params[:book_id]
      @parent = @author.books.find(params[:book_id])
    end

    render json: @parent.pictures
  end

  # GET /pictures/1
  def show
    render json: @picture
  end

  # POST /pictures
  def create
    @picture = Picture.new(picture_params)

    if params[:book_id]
      @parent = @author.books.find(params[:book_id])
    end

    @picture.imageable = @parent

    if @picture.save
      render json: @picture, status: :created
    else
      render json: @picture.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pictures/1
  def update
    if @picture.update(picture_params)
      render json: @picture
    else
      render json: @picture.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pictures/1
  def destroy
    @picture.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    def set_parent
      @parent = Author.find(params[:author_id])
    end

    # Only allow a trusted parameter "white list" through.
    def picture_params
      params.require(:picture).permit(:path, :author_id, :book_id)
    end
end
