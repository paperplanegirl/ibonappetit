class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  # GET /users
  def index
    @users = User.all
    # @reservation = @users[0]
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Account successfully created. Please fill in your details."
      redirect_to edit_user_path(@user)
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update

    # if params[:user][:profile_img_url]
    #   uploaded_file = params[:user][:profile_img_url].path
    #   cloudinary_file = Cloudinary::Uploader.upload(uploaded_file)
    #   params[:user][:profile_img_url] = cloudinary_file["url"]
    # end
    if @user.update(user_params)
      flash[:success] = "User account updated."
      redirect_to root_path
      return
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy

    redirect_to users_url, notice: 'User destroyed successfully'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :contact_number,:bio, :country, :password, :city, :profile_img_url)
  end
end
