class UsersController < ApplicationController

  before_filter :load_user

  def show

  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_show_path, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def load_user
    if current_user
      @user = current_user
    else
      redirect_to root_url
    end
  end

  def user_params
    params.require(:user).permit(:name, :linkedin)
  end
end
