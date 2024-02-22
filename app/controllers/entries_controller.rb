class EntriesController < ApplicationController
  
  def show
    @entry = Entry.find_by({"id" => params["id"]})
    @place = Place.find_by({"id" => @entry["place_id"]})
  end

  def new
    @entry = Entry.new
    @place = Place.find_by({"id" => params["place_id"]})
  end

  def create
    @entry = Entry.new

    # assign user-entered form data to Contact's columns
    @contact["first_name"] = params["first_name"]
    @contact["last_name"] = params["last_name"]
    @contact["email"] = params["email"]
    @contact["phone_number"] = params["phone_number"]

    # assign relationship between Contact and Company
    @contact["company_id"] = params["company_id"]

    # save Contact row
    @contact.save

    # redirect user
    redirect_to "/companies/#{@contact["company_id"]}"
  end
  

end
