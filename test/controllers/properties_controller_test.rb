require "test_helper"

class PropertiesControllerTest < ActionDispatch::IntegrationTest

  # Checks path/controller can be reached
  test "should get index" do
    get properties_path
    assert_response :success
  end
  # Checks path/controller can be reached   
  test "should update demo data on one property" do
    patch update_properties_path(property_id: Property.pick(:id)) 
    assert_redirected_to properties_path
  end
  # Checks path/controller can be reached 
  test "should update demo data on all properties" do
    patch update_properties_path(property_id: Property.pick(:id)) 
    assert_redirected_to properties_path
  end

  # Checks path/controller can be reached
  test "should create one new property" do
    patch new_properties_path
    assert_redirected_to properties_path
  end

  # Checks path/controller can be reached 
  test "should delete one property" do
    patch update_properties_path(property_id: Property.pick(:id)) 
    assert_redirected_to properties_path
  end

  # Checks path/controller can be reached
  test "should reset demo data on all properties " do
    post reset_properties_path
    assert_redirected_to properties_path
  end
  
end
