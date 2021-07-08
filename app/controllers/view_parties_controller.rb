class ViewPartiesController < ApplicationController
  def new
    @viewing_party = ViewParty.new
  end
end