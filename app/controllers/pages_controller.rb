class PagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @pages = policy_scope(Page)
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
      create_connection
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
        # if !editor_id # want to check that the current user is not already among editor_ids
        #  create_connection
        # end
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
  
  def create_connection
    Connection.create(editor_id: current_user.id, page_id: @page.id)
  end

  def page_params
    params.require(:page).permit(:title, :body, :public, references_attributes: [:id, :body, :_destroy])
  end

end
