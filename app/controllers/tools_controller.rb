class ToolsController < ApplicationController

   def show
        @posts = Post.where(tool_id: params[:id])
    
    end
end
