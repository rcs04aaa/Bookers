class BooksController < ApplicationController
  
  def create
    @list = Book.new(book_params)
    if @list.save
      flash[:notice] = "created successfully"
      redirect_to book_path(@list.id)
    else
      render :new
    end
  end

  def index
    @lists = Book.all
    @list = Book.new
  end

  def show
    @list = Book.find(params[:id])
  end

  def edit
    @list = Book.find(params[:id])
  end
  
  def update
    list = Book.find(params[:id])
    list.update(book_params)
    flash[:notice] = "updated successfully"
    redirect_to book_path(list.id)  
  end
  
  def destroy
    list = Book.find(params[:id])
    list.destroy
    flash[:notice] = "deleted successfully"
    redirect_to '/books'
  end
  
private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
