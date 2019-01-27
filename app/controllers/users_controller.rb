class UsersController < ApplicationController
    
    
    
    def twitter
        
    end
    
    def show 
   
        @user = User.find(params[:id])
        @posts = @user.posts.includes(:user,:imagetexts).order("created_at DESC").page(params[:page]).per(5)
         
        
        @mypagecomment = MypageComment.new
        @mypagecomments = MypageComment.where(userpage:params[:id]).order("created_at DESC")
    
         
         
        @series = current_user.posts.pluck("series").uniq.reject(&:blank?)
        
       
        @post_series = current_user.posts.where("series IN(?)", @series) 
        render :layout => "second_layout"
        
    end 
    
    
    def edit
        render :layout => "second_layout"
    end
    
    def update
        current_user.update(update_params)
    end
    
    
    
    # def series
        
    #     @series = current_user.post.pluck("series").uniq.reject(&:blank?)
        
         
        
    #     @post_series = Post.where("series IN(?)", @series) 
        
        
        
    # end
    
    def series_new
        
        titles = current_user.posts.all.pluck(:title)
        @titles = [""]
        @titles << titles
        @titles = @titles.flatten
        
    end
    
    def series_create
        
        
        #空の文字列のハッシュ要素を削除してくれるメソッドtransform以下
        series = String
        series = series_params[:series]
        params = series_params.transform_values(&:presence).compact
        
    
        params = params.values
        params = params.drop(1)
       
        @posts = []
    
        params.each do |param|
            
           @posts << Post.where(title:param) 
         
        end
       
        @posts.each do |post|
           
            post.update_all(:series => series)
        end
        
        
    end
    
    
    def series_update
       
       Post.where(series:params[:series]).update_all(series:nil)
        
    end
    
    
    def inquiry
    
        
    end
    
    def inquiry_send
      
        
       inquiry = Inquiry.new(name: params[:name],email: params[:email],message: params[:text])
       InquiryMailer.send_mail(inquiry).deliver_now
       

        
    end
    
    
    
    private
    def update_params
        params.require(:user).permit(:nickname, :email, :introduction, :avatar)
    end
    
    def series_params
        params.permit(:series,:post1,:post2,:post3,:post4,:post5,:post6,:post7,:post8) 
    end
    
   
    
end
