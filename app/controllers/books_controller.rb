class BooksController < ApplicationController
  
  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "created successfully"
      redirect_to book_path(@list.id)
    else
      render :new
    end
  end

  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    redirect_to book_path(@list.id)
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(book_params)
    flash[:notice] = "updated successfully"
    redirect_to book_path(list.id)  
  end
  
  def destroy
    list = List.find(params[:id])
    list.destroy
    flash[:notice] = "deleted successfully"
    redirect_to '/books'
  end
  
private

  def list_params
    params.require(:list).permit(:title, :body)
  end
end
