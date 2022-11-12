class BooksController < ApplicationController

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
    redirect_to post_images_path
    end
  end

  def index
    @books = Book.all
    @user=current_user
  end

  def show
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end
