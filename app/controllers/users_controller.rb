class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], description: params[:description])

    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
