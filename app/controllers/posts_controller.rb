class PostsController < ApplicationController
  before_filter :require_logined, :only => ['edit', 'new', 'create', 'destroy', 'update']

  def index
    @posts = Post.post_type(params[:post_type])

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @post = Post.new(:post_type => params[:post_type])

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    @post.post_type = params[:post_type]

    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(post_url(:id => @post, :post_type => params[:post_type])) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to(:id => @post, :post_type => @post.post_type) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
    end
  end

end
