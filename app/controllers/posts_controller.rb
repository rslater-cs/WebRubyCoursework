class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]
  before_action :set_user, only: [:new, :create,]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    if @user.nil?
      if post_params[:user_id].nil?
        flash[:alert] = "Login to create posts"
        redirect_to root_path
        return
      end
      @user = User.find(post_params[:user_id])
    end
    @post = @user.posts.new
  end

  # POST /posts
  # POST /posts.json
  def create
    uploaded_image = post_params[:image]
    filename = nil
    if uploaded_image
      filename = uploaded_image.original_filename

      File.open(Rails.root.join('public', 'uploads', filename), 'wb') do |file|
        file.write(uploaded_image.read)
      end
    end

    if @user.nil?
      if session[:user_id].nil?
        flash[:alert] = "Login to create posts"
        redirect_to root_path
        return
      end
      @user = User.find(post_params[:user_id])
    end

    @post = @user.posts.new(content: post_params[:content], image: filename, dateposted: Time.now)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    unless @post.image.nil?
      File.delete(Rails.root.join('public', 'uploads', @post.image))
    end
      @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_user
      if session[:user_id].nil?
        @user = nil
      else
        @user = User.find(session[:user_id])
      end
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:user_id, :content, :image, :dateposted)
    end
end
