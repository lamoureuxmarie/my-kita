class BookmarksController < ApplicationController
  before_action :find_bookmark, only: %i[show edit update destroy change_status]

  def index
    @bookmarks = policy_scope(Bookmark)
    if params[:query].present?
      kinder_gartens = KinderGarten.search_by_name_address(params[:query])
      @bookmarks = current_user.bookmarks.where(kinder_garten: kinder_gartens)
    else
      @bookmarks = current_user.bookmarks
    end
  end

  def show
  end

  def new
    authorize @bookmark
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.user = current_user
    authorize @bookmark
    @kinder_garten = KinderGarten.find(params[:kinder_garten_id])
    @bookmark.kinder_garten = @kinder_garten
    @bookmark.save
    @bookmark.liked!
  end

  def edit
    authorize @bookmark
  end

  def update
    authorize @bookmark
    if @bookmark.update(bookmark_params)
      redirect_to bookmarks_path(anchor: "bookmark_#{@bookmark.id}"), notice: "Updated successfully"
    else
      render :edit
    end
  end

  def destroy
    authorize @bookmark
    @bookmark.destroy
    redirect_to bookmarks_path, status: :see_other
  end

  def change_status
    # Dynamic methodcalling
    authorize @bookmark
    @bookmark.public_send("#{params[:status]}!")
    # @bookmark.emailed!
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:status, :comment)
  end

  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
