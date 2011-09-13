# require 'digest/md5'
class ApplicationController < ActionController::Base
  protect_from_forgery
  include AuthenticationHelper

  protected
  #TODO need to move to Post model
  def get_one_day_id(ip)
    salt_key = '^trdcu%d'
    today = Date.today.strftime('%Y%m%d')
    Digest::MD5.hexdigest(ip+salt_key+today).crypt('id').slice(-8,8)
  end
end
