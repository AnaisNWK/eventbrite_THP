class UsersController < ApplicationController
  before_action :authenticate_user!

	def new
		@user = User.new
	end 

  def create
  user_params = params.require(:user).permit(:first_name, :last_name, :age, :city_id, :email, :password, :password_confirmation)
  @user = User.new(user_params)
  if @user.save
    log_in(@user)
    remember(@user)
    flash[:success] = "Votre compte a été créé avec succès !"
    redirect_to root_path
  else
    render :new
  end
end

def show
	@user = User.find(params[:id])
end



end