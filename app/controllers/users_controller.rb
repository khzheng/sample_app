class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
      @user = User.new(user_params)
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to the Sample App!"
        # by default, Rails will try to render teh respective view, but create does not exist so we redirect
        redirect_to @user
      else
        render 'new'
      end
    end
    
    private
      # its not safe to mass assign params, so we use strong paramters
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
end
