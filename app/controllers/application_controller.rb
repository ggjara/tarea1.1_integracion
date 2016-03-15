class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def validar
    render plain: params
  end

  def status
  render status: 201, json: @controller.to_json
  #respond_to do |format|
   # format.html{ render status: :not_found }
    #format.xml { render xml: @people }
  #end
  end

end
