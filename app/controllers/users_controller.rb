class UsersController < ApplicationController
  def new
    @user=User.new
  end
  def index
    redirect_to new_user_path
  end
  def show
      @user= User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end

  def create
    @user=User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  def update
    @user = User.find(params[:id])
   
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
   
    redirect_to welcome_index_path
  end

  private 
  def user_params
    params.require(:user).permit(:name, :contactno, :address, :email, :dob, :bloodgrp)
  end

 end
