class PropertiesController < ApplicationController

  require 'rest-client'

  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
    render :show
  end

  # This action creates a new property- takes user input and adds in demo data from API after creation
  def new_property

  # This code block can be used to actually fetch from the api--make sure to remove hard coded data if using.
    # key = Rails.application.credentials.dig(:demo_data_api_key)
    # api_call = "https://api.datapartners.com/v2/demographics?lat="+property.lat.to_s+"&lng="+property.long.to_s+"&key="+key
    # puts api_call
    # demo_data =RestClient.get(api_call)

    demo_data= {
      "data": {
        "type": "Demographics",
          "attributes": {
            "income": {
              "label": "Income",
              "type": "standalone",
                "variables": [
                {
                "variable": "avg_household_income",
                "value": 88555.1858,
                "label": "Average household income"
                },
                {
                "variable": "avg_individual_income",
                "value": 39706.2035,
                "label": "Average individual income"
                }
                ]
              },
              "commute_mode": {
              "label": "Commute mode",
              "type": "percent",
                "variables": [
                {
                "variable": "transit",
                "value": 0.3483,
                "label": "Public transit"},
                {
                "variable": "foot",
                "value": 0.271,
                "label": "Foot"
                },
                {
                "variable": "bicycle",
                "value": 0.115,
                "label": "Bicycle"
                },
                {
                "variable": "drive",
                "value": 0.2339,
                "label": "Car"
                }
                ]
            }
          }
        }
      }
    # Generating new property from form data
    property=Property.new(name:params[:name], street_address:params[:street_address], city:params[:city], country:params[:country], lat:params[:lat], long:params[:long])
    
# Assigning data to property obj
    # The rescues are redundant with hardcoded data- but useful in case of malformed api responses.
    # In later updates the rescue will create an error log instead of just a puts statement
    begin
      property.avg_household_income=demo_data[:data][:attributes][:income][:variables][0][:value]
    rescue => e
      puts e
    end
    begin
      property.avg_individual_income=demo_data[:data][:attributes][:income][:variables][1][:value]
    rescue => e
      puts e
    end
    begin
      property.public_transit_commute_percent=demo_data[:data][:attributes][:commute_mode][:variables][0][:value]
    rescue => e
      puts e
    end
    begin
      property.walking_commute_percent=demo_data[:data][:attributes][:commute_mode][:variables][1][:value]
    rescue => e
      puts e
    end
    begin
      property.bike_commute_percent=demo_data[:data][:attributes][:commute_mode][:variables][2][:value]
    rescue => e
      puts e
    end
    begin
      property.drive_commute_percent=demo_data[:data][:attributes][:commute_mode][:variables][3][:value]
    rescue => e
      puts e
    end
    # Saving the property
    property.save

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

  # This code block can be used to actually fetch from the api--make sure to remove hard coded data if using.
    # key = Rails.application.credentials.dig(:demo_data_api_key)
    # api_call = "https://api.datapartners.com/v2/demographics?lat="+property.lat.to_s+"&lng="+property.long.to_s+"&key="+key
    # puts api_call
    # demo_data =RestClient.get(api_call)

    demo_data= {
      "data": {
        "type": "Demographics",
          "attributes": {
            "income": {
              "label": "Income",
              "type": "standalone",
                "variables": [
                {
                "variable": "avg_household_income",
                "value": 88555.1858,
                "label": "Average household income"
                },
                {
                "variable": "avg_individual_income",
                "value": 39706.2035,
                "label": "Average individual income"
                }
                ]
              },
              "commute_mode": {
              "label": "Commute mode",
              "type": "percent",
                "variables": [
                {
                "variable": "transit",
                "value": 0.3483,
                "label": "Public transit"},
                {
                "variable": "foot",
                "value": 0.271,
                "label": "Foot"
                },
                {
                "variable": "bicycle",
                "value": 0.115,
                "label": "Bicycle"
                },
                {
                "variable": "drive",
                "value": 0.2339,
                "label": "Car"
                }
                ]
            }
          }
        }
      }
    
    # Assigning data to property obj
    # The rescues are redundant with hardcoded data- but useful in case of malformed api responses.
    # In later updates the rescue will create an error log instead of just a puts statement
    begin
      property.avg_household_income=demo_data[:data][:attributes][:income][:variables][0][:value]
    rescue => e
      puts e
    end
    begin
      property.avg_individual_income=demo_data[:data][:attributes][:income][:variables][1][:value]
    rescue => e
      puts e
    end
    begin
      property.public_transit_commute_percent=demo_data[:data][:attributes][:commute_mode][:variables][0][:value]
    rescue => e
      puts e
    end
    begin
      property.walking_commute_percent=demo_data[:data][:attributes][:commute_mode][:variables][1][:value]
    rescue => e
      puts e
    end
    begin
      property.bike_commute_percent=demo_data[:data][:attributes][:commute_mode][:variables][2][:value]
    rescue => e
      puts e
    end
    begin
      property.drive_commute_percent=demo_data[:data][:attributes][:commute_mode][:variables][3][:value]
    rescue => e
      puts e
    end

    # Saving property
    property.save

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
      # api_call = "https://api.datapartners.com/v2/demographics?lat="+property.lat.to_s+"&lng="+property.long.to_s+"&key="+key
      # puts api_call
      # demo_data =RestClient.get(api_call)

      demo_data= {
        "data": {
          "type": "Demographics",
            "attributes": {
              "income": {
                "label": "Income",
                "type": "standalone",
                  "variables": [
                  {
                  "variable": "avg_household_income",
                  "value": 88555.1858,
                  "label": "Average household income"
                  },
                  {
                  "variable": "avg_individual_income",
                  "value": 39706.2035,
                  "label": "Average individual income"
                  }
                  ]
                },
                "commute_mode": {
                "label": "Commute mode",
                "type": "percent",
                  "variables": [
                  {
                  "variable": "transit",
                  "value": 0.3483,
                  "label": "Public transit"},
                  {
                  "variable": "foot",
                  "value": 0.271,
                  "label": "Foot"
                  },
                  {
                  "variable": "bicycle",
                  "value": 0.115,
                  "label": "Bicycle"
                  },
                  {
                  "variable": "drive",
                  "value": 0.2339,
                  "label": "Car"
                  }
                  ]
              }
            }
          }
        }
      
# Assigning data to property obj
    # The rescues are redundant with hardcoded data- but useful in case of malformed api responses.
    # In later updates the rescue will create an error log instead of just a puts statement
    begin
      property.avg_household_income=demo_data[:data][:attributes][:income][:variables][0][:value]
    rescue => e
      puts e
    end
    begin
      property.avg_individual_income=demo_data[:data][:attributes][:income][:variables][1][:value]
    rescue => e
      puts e
    end
    begin
      property.public_transit_commute_percent=demo_data[:data][:attributes][:commute_mode][:variables][0][:value]
    rescue => e
      puts e
    end
    begin
      property.walking_commute_percent=demo_data[:data][:attributes][:commute_mode][:variables][1][:value]
    rescue => e
      puts e
    end
    begin
      property.bike_commute_percent=demo_data[:data][:attributes][:commute_mode][:variables][2][:value]
    rescue => e
      puts e
    end
    begin
      property.drive_commute_percent=demo_data[:data][:attributes][:commute_mode][:variables][3][:value]
    rescue => e
      puts e
    end
      # saving property
      property.save

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
