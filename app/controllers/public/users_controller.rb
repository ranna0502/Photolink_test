class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]

  def show
  end


# URLを直接入力されても遷移しない
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
