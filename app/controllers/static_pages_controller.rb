class StaticPagesController < ApplicationController
  def about
    respond_to do |format|
      format.html { render :about }
   end
  end
end
