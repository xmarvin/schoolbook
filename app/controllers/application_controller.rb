class ApplicationController < ActionController::Base
 before_filter :authenticate_user!
  #protect_from_forgery

  inherit_resources

 # rescue_from CanCan::AccessDenied do |exception|
 #   flash[:error] = exception.message
 #   render :text => "access denied"
 # end

end
