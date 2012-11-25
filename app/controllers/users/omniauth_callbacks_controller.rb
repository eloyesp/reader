module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "google") if is_navigational_format?
      end
    end

    def twitter
        # You need to implement the method below in your model (e.g. app/models/user.rb)
        @user = User.find_for_twitter(request.env["omniauth.auth"], current_user)

        if @user.persisted?
          flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Twitter"
          sign_in_and_redirect @user, :event => :authentication
        end
    end
  end
end

