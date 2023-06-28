class UsersController < ApplicationController

  def create
    @user = User.new(name:params[:name])
    if params[:image]
      @user.icon_path = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.icon_path}", image.read)
    end
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
    @user = current_user
  end
  
end

