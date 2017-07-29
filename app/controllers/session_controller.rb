class SessionController < ApplicationController
  before_action :logged_user, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      log_in user
      redirect_to user
    else
      respond_to do |format|
        format.html {redirect_to login_path, alert: 'Algo deu errado!'}
      end
    end
  end

  def destroy
    log_out
    redirect_to login_path #root
  end

  private
    def session_params
      params.require(:session).permit(:email, :password)
    end

    def logged_user
      respond_to do |format|
        format.html { redirect_to current_user, alert: "Já está logado!" }
      end if logged_in?
    end
end
