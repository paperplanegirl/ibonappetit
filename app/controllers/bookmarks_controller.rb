class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  # GET /bookmarks
  def index
    @bookmarks = Bookmark.all
  end

  # GET /bookmarks/1
  def show
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
    restaurant_id = params[:restaurant]
    @restaurant = Restaurant.find_by_id(restaurant_id)
    user_id = params[:user]
    @user = User.find_by_id(user_id)
  end

  # GET /bookmarks/1/edit
  def edit
  end

  # POST /bookmarks
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user_id = @current_user.id
    @restaurant = @bookmark.restaurant

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully created.' }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { render :new }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmarks/1
  def update
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookmark }
      else
        format.html { render :edit }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_params
      params.require(:bookmark).permit(:bookmark_date, :first_name, :last_name, :restaurant_name, :restaurant_id)
    end

    def show_bookmark_params
      params.require(:bookmark).permit(:bookmark_date, :first_name, :last_name, :restaurant_name)
    end
end
