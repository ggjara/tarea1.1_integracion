class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def validar
    render text: "Thanks for sending a POST request with cURL! Payload: #{request.body.read}"
  end

  def status
  respond_to do |format|
    format.html{ render text: "Status"}
    format.xml { render xml: @people }
  end
  	
  end

end
