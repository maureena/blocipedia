class PagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
    @invite = Invite.new
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page was saved."
      redirect_to @page
    else
      flash[:error] = "There was an error saving the page. Please try again."
      render :new
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page was updated."
      redirect_to @page
    else
      flash[:error] = "There was an error saving the page. Please try again."
      render :edit
    end
  end

  def destroy
    @page = Page.find(params[:id])
    title = @page.title

    if @page.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to pages_path
    else
      flash[:error] = "There was an error deleting the page."
      render :show
    end
  end

  private
  
  def page_params
    params.require(:page).permit(:title, :body, :public, references_attributes: [:id, :body, :_destroy])
  end

end
