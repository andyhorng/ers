class FaqsController < ApplicationController
  before_filter :require_logined, :only => ['destroy', 'update']

  def index
    @faqs = Faq.all(:order => 'created_at DESC').paginate(:page => params[:page], :per_page => 7)
    @faq = Faq.new

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def create
    Faq.create(params[:faq])
    redirect_to :action => :index
  end

  def destroy
    Faq.destroy(params[:id])
    redirect_to :action => :index
  end

  def update
    @faq = Faq.find(params[:id])
    @faq.update_attributes(params[:faq])
    redirect_to :action => :index
  end
end
