class PagesController < ApplicationController
  include HighVoltage::StaticPage
#  before_action :authenticate_user!
#  load_and_authorize_resource
  
#  layout :layout_for_page

  private

#  def layout_for_page
#    case params[:id]
#    when 'home'
#      'home'
#    else
#      'application'
#    end
#  end
end
