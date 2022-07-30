class UsersController < ApplicationController
    #didn't finish the user password change action, dont know how to varify and pass the new password to the server.

    before_action :find_user, only: [:edit, :update]
    before_action :authenticate_user!, except: [:new, :create]
    before_action :authorize_user!, except: [:new, :create]


    # ============create =========
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation))
        if @user.save
            session[:user_id] = @user.id
            flash.notice = 'Signed up!'
            redirect_to root_path
        else
            render :new, status: 303
        end
    end

    #===========edit=======
    def edit

    end

    def update
        if @user.update(params.require(:user).permit(:first_name, :last_name, :email))
            flash[:notice]= "Infomation updated!"
            redirect_to root_path
        else
            render :edit
        end
    end

    #==========change password======
    def change_password
        # if @user.update(params.require(:user).permit( :password, :password_confirmation))
    end



    private

    def find_user
        @user = current_user
    end

    def user_params
        
    end

    def authorize_user!

    end
   
end
