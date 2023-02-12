module PropertiesHelper

  def apply_demo_data(property, api_url)
  # This code block can be used to actually fetch from the api--make sure to remove hard coded data if using.
    # demo_data =RestClient.get(api_url)
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
    # Saving the property
    property.save
  end
end

