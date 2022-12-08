class ApplicationController < ActionController::Base
  before_action :initialize_session

  private
  def initialize_session
    session[:shopping_cart] ||= [] # Set the shopping cart to an empty array if it doesn't exist
  end
end
