class PropertiesController < ApplicationController

  require 'rest-client'
  include PropertiesHelper

  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
    render :show 
  end

  # This action creates a new property- takes user input and adds in demo data from API after creation
  def new_property

    # Generating new property from form data
    property=Property.new(name:params[:name], street_address:params[:street_address], city:params[:city], country:params[:country], lat:params[:lat], long:params[:long])
    
    # key = Rails.application.credentials.dig(:demo_data_api_key)
    # api_url = "https://api.datapartners.com/v2/demographics?lat="+property.lat.to_s+"&lng="+property.long.to_s+"&key="+key
    api_url='fake_url'
    # Appending all the demo data
    apply_demo_data(property,api_url)

    # Getting fresh list and redirecting
    @properties = Property.all
    redirect_to :properties
  end

  # Deletes a property
  def delete_property
    # Removing property based on ID provided
    Property.find(params[:property_id]).destroy
    # Fresh list of properties and redirecting
    @properties = Property.all
    redirect_to :properties
  end
  
  # Updates the demo data of one property
  def update

    # Getting the property from DB by given ID
    property = Property.find(params[:property_id])

  # key = Rails.application.credentials.dig(:demo_data_api_key)
    # api_url = "https://api.datapartners.com/v2/demographics?lat="+property.lat.to_s+"&lng="+property.long.to_s+"&key="+key
    api_url='fake_url'
    # Appending all the demo data
    apply_demo_data(property,api_url)

    # Fresh list of properties and redirecting
    @properties = Property.all
    redirect_to :properties

  end

  # Updates the demo data of all properties
  def update_all 
    
    # Getting all properties from DB
    properties = Property.all

    # Looping over properties to add demo data to each
    for property in properties do
      
  # This code block can be used to actually fetch from the api--make sure to remove hard coded data if using.
    # key = Rails.application.credentials.dig(:demo_data_api_key)
    # api_url = "https://api.datapartners.com/v2/demographics?lat="+property.lat.to_s+"&lng="+property.long.to_s+"&key="+key

    api_url='fake_url'
    # Appending all the demo data
    apply_demo_data(property,api_url)

    end
    
    # Getting fresh list of properties and redirecting to refresh
    @properties = Property.all
    redirect_to :properties
  end 

  def reset_all
    # Getting all properties from DB
    properties = Property.all

    # Looping over properties to add demo data to each
    for property in properties do

      # Setting all to 0
      property.avg_household_income=0
      property.avg_individual_income=0
      property.public_transit_commute_percent=0
      property.walking_commute_percent=0
      property.bike_commute_percent=0
      property.drive_commute_percent=0

      # saving property
      property.save

      end
      
      # Getting fresh list of properties and redirecting to refresh
      @properties = Property.all
      redirect_to :properties
  end
end

