class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  require 'digest'

  def validar
  	mensaje = params[:mensaje]
  	hash = params[:hash].downcase

  	sha256 = Digest::SHA256.new
	digest = sha256.hexdigest mensaje


		if((mensaje.is_a? String| | Base64.isBase64(String mensaje)) && (hash.is_a? String) && mensaje != nil && hash != nil)
			if (hash==digest)
				#render text: request.body.read
		    	render json: {:mensaje=> mensaje, :valido=> true}
			else
				render json: {:mensaje=> mensaje, :valido=> false}
			end
		else
			render status: 400, json: @controller.to_json
		end

     #render text: "Thanks for sending a POST request with cURL! Payload: #{request.body.read}"
  end

  def status

  render status: 201, json: @controller.to_json
  #respond_to do |format|
   # format.html{ render status: :not_found }
    #format.xml { render xml: @people }
  #end
  end

end
