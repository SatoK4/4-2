class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      # 後ほど遷移先を変更
      redirect_to book_path
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
