class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController


    def twitter
        callback_from :twitter
    end
    
    private
    
    
    def callback_from(provider)
        provider = provider.to_s
        
      
        
        @user = User.find_for_oauth(request.env['omniauth.auth'])
        


        
        if @user.persisted?
            flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
            sign_in_and_redirect @user, event: :authentication
        else
          session["devise.#{provider}_data"] = request.env['omniauth.auth']
          redirect_to new_user_registration_url
        end
        
        
        
        #sessionに保存する
        
        auth = request.env['omniauth.auth']
        
        session[:user_id] = auth['uid']
        session[:name] = auth['info']['name']
        
         # 投稿に必要なauth_token, secret_tokenも取得する
         session[:oauth_token] = auth['credentials']['token']
         session[:oauth_token_secret] = auth['credentials']['secret']



        
        
    end
    
    
    
    def destroy
        reset_session
        redirect_to root_pat
        
    end
    
end