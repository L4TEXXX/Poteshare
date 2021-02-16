class UsersController < ApplicationController
  

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      flash[:notice] = "ユーザー登録が完了しました"
    else
      render "new"
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
      flash[:notice] = "ログインしました"
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      render "login_form"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to login_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "登録情報を更新しました"
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  def myrooms
    @user = User.find(params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:image,:intro)
  end
end
