class LikesController < ApplicationController
    before_action :set_post
 

    def create
        @like = Like.create(user_id: current_user.id, post_id: params[:post_id])
        @likes = Like.where(post_id: params[:post_id])
        @post.reload
        # Post.all
        # @post = Post.find(params[:post_id])
        
    end
    
    def destroy
        like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
        like.destroy
        @likes = Like.where(post_id: params[:post_id])
        @post.reload
        
        # @posts = Post.all
        # @post = Post.find(params[:post_id])
        
    end
    
    private
    
    def set_post
     @posts = Post.all
     @post = Post.find(params[:post_id])
    end

    
end
