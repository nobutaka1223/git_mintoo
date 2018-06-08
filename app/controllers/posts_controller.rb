class PostsController < ApplicationController
      #before_action :authenticate_user!
    
    def index
        @posts = Post.includes(:user,:imagetexts).order("created_at DESC").page(params[:page]).per(5)
    end


    def new
        redirect_to action: :index  unless user_signed_in?
        
        @post = Post.new
        @post.imagetexts.build
    end


    def create
        #Post.create(post_params)
        current_user.posts.create(post_params)
   
        
        redirect_to action: :index
    end


    def show
        @post = Post.find(params[:id])
        @comments = @post.comments.includes(:user)
    end
    
    def edit
        redirect_to action: :index  unless user_signed_in?
        @post = Post.find(params[:id])
    end



    def destroy
        
        post = Post.find(params[:id])

        post.destroy if post.user_id == current_user.id
    end

    
    

    private
    def post_params
        params.require(:post).permit(
            :user_id,
            :title, 
            :tool_id, 
            imagetexts_attributes:[:image, :content, :status])
    end

    
    def move_to_index
        redirect_to action: unless user_signed_in?
    end
    
    
    
    
    end   
end
