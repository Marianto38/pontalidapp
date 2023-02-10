class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice("provider", "uid")
    user_params.merge! auth.info.slice("email", "first_name", "last_name")
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  #Google
  def self.from_omniauth(auth)
    # This line checks if the user email received by the Omniauth is already included in our databases.
      user = User.where(email: auth.info.email).first
    # This line sets the user unless there is a user found in the line above, therefore we use ||= notation to evaluate if the user is nill, then set it to the User.create
    
      user ||= User.create!(provider: auth.provider, uid: auth.uid, email: auth.info.email, password: Devise.friendly_token[0, 20])
      user
    end

    # def [omni_prvider]
    #   # You need to implement the method below in your model (e.g. app/models/user.rb)
    #   @user = User.from_omniauth(request.env[‘omniauth.auth’])
    #   if @user.persisted?
    #   flash[:notice] = I18n.t ‘devise.omniauth_callbacks.success’, kind: ‘[provider]’
    #   sign_in_and_redirect @user, event: :authentication
    #   else
    #   session[‘devise.[provider]_data’] = request.env[‘omniauth.auth’].except(‘extra’) # Removing extra as it can overflow
    #   redirect_to new_user_registration_url, alert: @user.errors.full_messages.join(“\n”)
    #   end
end
