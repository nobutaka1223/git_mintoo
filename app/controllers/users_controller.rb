class UsersController < ApplicationController
    
    def show 
        @user = User.find(params[:id])
        @posts = @user.posts.includes(:user,:imagetexts).order("created_at DESC").page(params[:page]).per(5)
      
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
