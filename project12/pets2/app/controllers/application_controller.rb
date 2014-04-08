class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_login
	
  include CurrentSelection
	private
	
		def current_selection
			Selection.find(session[:selection_id])
		rescue ActiveRecord::RecordNotFound
			selection = Selection.create
			session[:selection_id] = selection.id
			selection
		end
    
    def not_authenticated
      redirect_to login_path, alert: "Please login first"
    end
end
