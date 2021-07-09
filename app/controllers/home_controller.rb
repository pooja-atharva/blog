class HomeController < ApplicationController
  def index
    p user_session
    p current_user
  end
end
