class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :update, :destroy]

  # GET /authors
  def index
    @authors = Author.all

    render json: @authors
  end

  # GET /authors/1
  def show
    render json: @author
  end

  # POST /authors
  def create
    @author = Author.new(author_params)

    if params[:picture]
      @picture = Picture.new(picture_params)
      @picture.imageable = @author

      if @picture.save
        render json: @author, status: :created
        return
      else
        render json: @author.errors, status: :unprocessable_entity
      end
    end

    if @author.save
        render json: @author, status: :created        
        # return
      else
        render json: @author.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /authors/1
  def update
    if params[:picture]
      if @author.pictures.where(id: params[:picture][:picture_id]).update(path: params[:picture][:path])
        render json: @author.pictures.where(id: params[:picture][:picture_id])
        return
      else
        render json: @author.errors, status: :unprocessable_entity
      end     
    end

    if @author.update(author_params)
      render json: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # DELETE /authors/1
  def destroy
    @author.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def author_params
      params.require(:author).permit(:name)
    end

    def picture_params
      params.require(:picture).permit(:path)
    end
  end
