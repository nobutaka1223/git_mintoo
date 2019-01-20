class CommentsController < ApplicationController
    
    def create
         @comment = Comment.create(text: comment_params[:text], post_id: comment_params[:post_id], user_id: current_user.id)
         @comments = Comment.where(post_id: params[:post_id])
         @post = Post.find(params[:post_id])
         
        
         #redirect_to "/posts/#{@comment.post.id}"   コメントと結びつく投稿の詳細画面に遷移
    end
    
    private
    def comment_params
        params.permit(:text, :post_id)
    end
end
