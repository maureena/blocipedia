class ReferencesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @references = Reference.all
  end

  def new
    @page = Page.find(params[:page_id])
    @reference = Reference.new
  end

  def create
    @page = Page.find(params[:page_id])
    @references = @page.references
    @reference = current_user.references.build(reference_params)
    @reference.page = @page
    #@new_reference = Reference.new(reference_params)

    if @reference.save
      flash[:notice] = "Reference was saved."
      redirect_to @page
    else
      flash[:error] = "There was an error saving the reference."
      render :new
    end
  end

  def edit
    @page = Page.find(params[:id])
    @reference = Reference.find(params[:id])
  end

private

def reference_params
  params.require(:reference).permit(:body, :page_id)
end

end
