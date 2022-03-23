class StaticPagesController < ApplicationController
  before_action :authenticate_user!, except: [:about]

  def about
    respond_to do |format|
      format.html { render :about }
   end
  end
end
