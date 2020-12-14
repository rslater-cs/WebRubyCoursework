class UsersController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
<<<<<<< HEAD
        session[:user_id] = @user[:id]
        format.html { redirect_to posts_path, notice: t(".success")}
=======
        session[:user_id] = @user
        format.html { redirect_to posts_path, notice: 'User was successfully created.' }
>>>>>>> parent of badd54f... created jquery validation for sign in field
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
