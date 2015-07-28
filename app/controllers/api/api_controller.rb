class Api::ApiController < ApplicationController 
  skip_before_filter :verify_authenticity_token
  
  # acts_as_token_authentication_handler_for User

end