module AuthenticationHelper
  def signed_in?
    !session[:logged_in].nil?
  end
  
  def ensure_signed_in
    unless signed_in?
      session[:redirect_to] = request.request_uri
      redirect_to(new_session_path)
    end
  end
end
