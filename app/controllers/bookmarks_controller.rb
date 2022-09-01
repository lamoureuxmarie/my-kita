class BookmarksController < ApplicationController
  before_action :find_bookmark, only: %i[show edit update destroy]

  def index
    @bookmarks = Bookmark.all
  end

  def show
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.user = User.last
    @kinder_garten = KinderGarten.find(params[:kinder_garten_id])
    @bookmark.kinder_garten = @kinder_garten
    @bookmark.save
  end

  def edit
  end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to bookmarks_path, notice: "Updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path, status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:status, :comment)
  end

  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
