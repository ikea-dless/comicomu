class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    provider = 'twitter'
    @user = User.find_for_oauth(request.env['omniauth.auth'])
    if @user.persisted?
      cookies.permanent[:comicomu_logined] = { value: @user.created_at }
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.twitter_data'] = request.env['omniauth.auth'].except('extra')
      redirect_to new_user_registration_url
    end
  end
end
