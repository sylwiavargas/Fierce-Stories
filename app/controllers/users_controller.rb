class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :update]
  # before_action :require_login
  # skip_before_action :require_login, only: [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @errors = flash[:errors]
  end

  def create
    @user = User.create(user_params)
      if @user.valid?
        flash[:success] = "Good job filling out the form!"
        log_in_user(@user.id)
        redirect_to story_books_path
      else
        flash[:errors] = @user.errors.full_messages        render :new
      end
  end

  def update
    if @user = User.update(user_params)
      
      @user.save
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    User.destroy(params[:id])
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation, :email)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
