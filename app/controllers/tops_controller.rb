class TopsController < ApplicationController
  include ApplicationHelper
  def index
    if logged_in?
      redirect_to homes_path
    else
      @admin = true
    end
  end
end
