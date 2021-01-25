class UsersController < ApplicationController
  

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.image = "default_icon.jpg"
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      flash[:notice] = "ユーザー登録が完了しました"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
      flash[:success] = "ログインしました"
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      render "login_form"
    end
  end


  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:image)
  end
end
