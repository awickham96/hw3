class PlacesController < ApplicationController

  def index
  @places = Place.all
  end

  def show
  @place = Place.find_by({"id" => params["id"]})
  end

  def new
  end

  def create
    @place = Places.new
    @place["name"] = params["name"]
    @place["activity"] = params["activity"]
    @place["date"] = params["date"]
    @place.save
    redirect_to "/places"
  end
end
