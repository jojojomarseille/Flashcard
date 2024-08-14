class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    def after_sign_in_path_for(resource)
      questions_path # ou une autre route
    end
  
    def after_sign_out_path_for(resource_or_scope)
      root_path
    end
end
