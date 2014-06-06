class UsersController < ApplicationController
  before_action :authenticate
  before_action :can_administer?, except: [ :index ]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url, notice: 'New user created.'
    else
      render :new
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user].delete :admin unless current_user.try(:admin?)
      params.require(:user).permit(:email, :password, :password_confirmation, :admin)
    end
end
