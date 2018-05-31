class BooksController < ApplicationController
  before_action :find_book, :only => [:edit, :show, :update, :destroy]
  before_action :find_author, :only => [:index, :new, :create]

  def index
    if params[:author_id].present?
      @books = @author.books
    else
      @books = Book.all
    end
  end

  def new
    if params[:author_id].present?
      @book = @author.books.build
    else
      @book = Book.new
    end
  end

  def create
    if  params[:author_id].present?
      @book = @author.books.build(book_params)
      if @book.save
        redirect_to authors_path, :notice => "Book created successfully."
      else
        render :action => "new"
      end
    else
      @book = Book.new(book_params)
      if @book.save
     	  redirect_to books_path, :notice => "Book created successfully."
      else
        render :action => "new"
      end
    end
  end

  def show

  end

  def update
    @book = @book.update_attributes(book_params)
    if @book.save
      redirect_to authors_path, :notice => "Book created successfully."
    else
      render :action => "new"
    end
  end

  def destroy

  end

  private
  def book_params
    params.require(:book).permit!
  end

  def find_book
    @book = Book.find(params[:id])
  end
  def find_author 
    if params[:author_id].present?
      @author = Author.find(params[:author_id])
    end
  end


end
