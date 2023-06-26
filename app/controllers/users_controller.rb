class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
      @user = User.new(
      name:params[:name]
      # email:params[:email]
      # image_name:"default_user.jpg"
     )
     if params[:image]
      @user.icon_path = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.icon_path}", image.read)
     end

  end

  def sach
    @users = User.all

  end

  def edit

    redirect_to @room
    
  end

  def update
    @user = current_user
    if @user.update(params.require(:user).permit( :name, :profile, :avatar,))
      redirect_to :users_account
    else
      render "edit"
    end
  end

  def profileedit
    # @user = User.find(params[:id])

    @user = current_user

  end

  def account
    @users = User.all

  end
  
end

