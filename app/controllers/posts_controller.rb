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
    #since testing cannot assign values to session variables
    if @user.nil?
<<<<<<< HEAD
      if post_params[:user_id].nil?
        #if user and user id does not exist then send error message and go back to root
        flash[:alert] = t(".user_not_logged_in")
        redirect_to root_path
        return
      end
      #if user id has been passed as a parameter then get user from database
=======
>>>>>>> parent of badd54f... created jquery validation for sign in field
      @user = User.find(post_params[:user_id])
    end
    #create new post
    @post = @user.posts.new
  end

  # POST /posts
  # POST /posts.json
  def create
    #load image from parameters
    uploaded_image = post_params[:image]
    #set default filename to be nil
    filename = nil
    #if there was a image uploaded then copy and paste that image into the public area and get the filename
    if uploaded_image
      filename = uploaded_image.original_filename

      File.open(Rails.root.join('public', 'uploads', filename), 'wb') do |file|
        file.write(uploaded_image.read)
      end
    end

    #for testing to work, the ability to pass user parameter must be used, in the release version
    # this would be removed
    # if there is no user or user id then an error must be sent
    if @user.nil?
<<<<<<< HEAD
      if session[:user_id].nil?
        flash[:alert] = t(".user_not_logged_in")
        redirect_to root_path
        return
      end
=======
>>>>>>> parent of badd54f... created jquery validation for sign in field
      @user = User.find(post_params[:user_id])
    end

    #create a new post with passed parameters and filename
    @post = @user.posts.new(content: post_params[:content], image: filename, dateposted: Time.now)

    #try to save the post, if save works then show success, if not then show failure
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: t("posts.success")+t(".success") }
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
    #if a image was uploaded then delete the image
    unless @post.image.nil?
      File.delete(Rails.root.join('public', 'uploads', @post.image))
    end
    #delete the post
    @post.destroy

    #send success message
    respond_to do |format|
        format.html { redirect_to posts_url, notice: t("posts.success")+t(".success") }
        format.json { head :no_content }
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

  #if the session variable is set, then grab the user from the database, if not
  # then set the user to nil
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
