class PagesController < ApplicationController
  def index
    @pages = Page.visible_to(current_user)
    authorize @pages
  end

  def show
    @page = Page.find(params[:id])
    authorize @page
    @invite = Invite.new
  end

  def new
    @page = Page.new
    authorize @page
  end

  def create
    @page = Page.new(page_params)
    authorize @page

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
    authorize @page
  end

  def update
    @page = Page.find(params[:id])
    authorize @page

    if @page.update_attributes(page_params)
      flash[:notice] = "Page was updated."
      redirect_to @page
    else
      flash[:error] = "There was an error saving the page. Please try again."
      render :edit
    end
  end

private
  
def page_params
  params.require(:page).permit(:title, :body)
end

end
