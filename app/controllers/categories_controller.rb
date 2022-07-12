class CategoriesController < ApplicationController
   load_and_authorize_resource except: :create
   

  def show
    @category = Category.find(params[:id])
    authorize! :read,  @category
  end

  def new
    @category = Category.new()
  end

  def update
    #byebug
    @category = Category.find(params[:id])
    @category.update(name: params[:name])

    redirect_to root_path
  
  end

  def new
    @category = Category.new()
  end

  def create 
     @category = Category.new(name: params[:category][:name])
      @category.save
      redirect_to categories_path
  end


  def index
    @category = Category.all
  end

  def destroy
    #byebug
     @category = Category.find(params[:id])
     @category.destroy
     redirect_to root_path

  end
end
