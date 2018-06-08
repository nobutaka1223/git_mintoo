class ToolsController < ApplicationController


    def new
        redirect_to action: :index  unless user_signed_in?
        
        @tool = Tool.new
    end
    
    def create
        
        #current_user.tool.create(tool_params)
        Tool.create(tool_params)
        redirect_to root_path
    end
    

    def show
        @posts = Post.where(tool_id: params[:id])
       
    end
    
    def show_ranking
        @posts = Post.where(tool_id: params[:id]).order("likes_count DESC")

    end
    
    private
    def tool_params
        params.require(:tool).permit(:name)
    end
    
end
