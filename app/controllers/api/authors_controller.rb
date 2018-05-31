class Api::AuthorsController < ApplicationController
  before_action :find_author, :only => [:edit, :show, :update, :destroy]
  #skip_before_action :verify_authenticity_token
  
  def index
   @authors = Author.all
   render json: @author
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new
    @author.first_name = params[:first_name]
    @author.last_name = params[:last_name]
    @author.date_of_birth = params[:date_of_birth]
    if @author.save
   	  render json: @author, :status => "Author is created successfuly", location: @author
    else
      render json: @author.errors, :status => "unprocessable_entity"
    end
  end

  def show
    render json: @author
  end

  def update
    @author.first_name = params[:first_name]
    @author.last_name = params[:last_name]
    @author.date_of_birth = params[:date_of_birth]
    if @author.save
      render json: @author, :status => "Author is Updated successfuly"
    else
      render json: @author.errors, :status => "unprocessable_entity"
    end
  end

  def destroy
    @author.destroy
  end

  private
  # def author_params
  #   params.require(:author).permit!
  # end

  def find_author
    @author = Author.find(params[:id])
  end

end
