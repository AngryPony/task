class ApplicationController < ActionController::Base
  def index
    redirect_to cards_camp_sites_path
  end
end
