class UsersController < ApplicationController
    
    def show 
        @user = User.find(params[:id])
        @nickname = @user.nickname
        @introduction = @user.introduction
        @posts = @user.posts.page(params[:page]).per(5).order("created_at DESC")
    end 
    
    
    def edit
        
    end
    
    def update
        current_user.update(update_params)
    end
    
    private
    def update_params
        params.require(:user).permit(:nickname, :email, :introduction, :avatar)
    end
    
end
