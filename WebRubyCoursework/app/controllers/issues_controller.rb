class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update]

  # GET /issues
  # GET /issues.json
  def index
    #if there is no session id, send error and redirect to root
    if session[:user_id].nil?
      redirect_to root_path
      flash[:alert] = t(".user_not_logged_in")
    else
      #get user from database and use email to get issue
      user = User.find_by(id: session[:user_id])
      email = user[:email]
      @issues = Issue.where(email: email)
    end
  end

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: t("issues.success")+t(".success") }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to issues_path, notice:  t("issues.success")+t(".success") }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def issue_params
      params.require(:issue).permit(:name, :email, :telephone, :message, :closed)
    end
end
