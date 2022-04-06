class Public::ActivityPointsController < ApplicationController

  def new
    @activity_point = ActivityPoint.new
    @user = current_user
  end

  def show
    @activity_point = ActivityPoint.find(params[:id])
    @user = current_user
  end

  def edit
    @activity_point = ActivityPoint.find(params[:id])

    # ログインユーザー以外編集できない
    if @activity_point.user != current_user
      redirect_to activity_point_path(@activity_point), alert: 'Warring!!'
    end
  end

  def update
    @activity_point = ActivityPoint.find(params[:id])
    if @activity_point.update(activity_point_params)
      redirect_to activity_point_path(@activity_point), notice: "You have updated book successfully."
    else
      render "edit"
    end

  end

  def destroy
    @activity_point = ActivityPoint.find(params[:id])
    @activity_point.destroy
    redirect_to new_activity_point_path
  end



  def create
    @activity_point = ActivityPoint.new(activity_point_params)
    @activity_point.user_id = current_user.id

    if @activity_point.save
      redirect_to activity_point_path(@activity_point), notice: "You have created book successfully."
    else
      render 'new'
    end

  end





  private

  def activity_point_params
    params.require(:activity_point).permit(:date,:time_zone,:person,:address,:request,:activity_status,:latitude,:longitude)
  end



end
