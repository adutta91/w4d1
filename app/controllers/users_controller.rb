# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  username   :string
#

class UsersController < ApplicationController
  def index
    # render text: "I'm in the index action!"
    @users = User.all
    render json: @users
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, staus: :unprocessable_entity
      )
    end
  end

  def show
    if params[:id]
      @user = User.find(params[:id])
      render json: @user
    else
      render(
      json: @user.errors.full_messages, staus: :unprocessable_entity
      )
    end
  end

  def update
    if params[:id]
      @user = User.find(params[:id])
      @user.update!(user_params)
      render json: @user
    else
      render(
      json: @user.errors.full_messages, staus: :unprocessable_entity
      )
    end
  end

  def destroy
    if params[:id]
      @user = User.find(params[:id])
      @user.delete
      render json: User.all
    else
      render(
      json: @user.errors.full_messages, staus: :unprocessable_entity
      )
    end
  end

  private
  def user_params
    params.require(:users).permit(:username)
  end

end
