class AuthorsController < ApplicationController
  before_action :find_author, :only => [:edit, :show, :update, :destroy]
  before_action :find_book, :only => [:index, :new, :create]


  def index
   @authors = Author.all
  end

  def new
    if params[:book_id].present?
      @author = @book.authors.build
    else
      @author = Author.new
    end
    
  end

  def create
    if params[:book_id].present?
      @author = @book.authors.build(author_params)
      if @author.save
        redirect_to books_path, :notice => "Author created successfully."
      else
        render :action => "new"
      end
    else
      @author = Author.new(author_params)
      if @author.save
        redirect_to authors_path, :notice => "Author created successfully."
      else
        render :action => "new"
      end
    end
  end

  def show
    #render :json => @author
    render :json => @author.books
  end

  def update
    if @author.update_attributes(author_params)
   	  redirect_to authors_path, :notice => "Author is updated successfully."
    else
      render :action => "edit"
    end
  end

  def destroy
    @author.destroy
    redirect_to "authors_path"
  end

  private
  def author_params
    params.require(:author).permit!
  end

  def find_book
    if params[:book_id].present? 
      @book = Book.find(params[:book_id])
    end
  end
  def find_author
    @author = Author.find(params[:id])
  end


end
