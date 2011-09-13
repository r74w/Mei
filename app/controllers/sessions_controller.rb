class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def new
    response.headers['WWW-Authenticate'] = Rack::OpenID.build_header(
        :identifier => AppConfig.admin_openid_discovery_url,
        :return_to => session_url,
        :method => 'POST')
    head 401
  end
  
  def create
    if openid = request.env[Rack::OpenID::RESPONSE]
      if openid.status == :success && openid.display_identifier == AppConfig.admin_openid
        ax = OpenID::AX::FetchResponse.from_success_response(openid)
        session[:logged_in] = true
        redirect_to(session[:redirect_to] || root_path)
      else
        #render :action => 'problem'
        redirect_to new_session_path
      end
    else
      redirect_to new_session_path
    end
  end
  
  def destroy
    session[:logged_in] = nil
    redirect_to root_path
  end
end
