class MypageCommentsController < ApplicationController
  
  
    def create
          MypageComment.create(comment_params)
          @mypagecomment = MypageComment.new
         @mypagecomments = MypageComment.where(userpage: params[:mypage_comment][:userpage]).order("created_at DESC")
         @user = User.find(params[:mypage_comment][:userpage])
       
      
         
        
         #redirect_to "/posts/#{@comment.post.id}"   コメントと結びつく投稿の詳細画面に遷移
   end
    
 

  def destroy
    
    
  end
  
  private
    def comment_params
        params.require(:mypage_comment).permit(:text, :user_id, :userpage)
    end
end
