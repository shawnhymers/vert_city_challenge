require "test_helper"

class PropertyTest < ActiveSupport::TestCase

  # Tests that the model validations wont add any properties without the required fields
  test "should not save property without name" do
    property = Property.new(name:"", street_address:"290 Bremner Blvd, Toronto", city:"Toronto", country:'Canada', lat:43.6426, long:79.3871)
    assert_not property.save
  end
  test "should not save property without address" do
    property = Property.new(name:"CN Tower", street_address:"", city:"Toronto", country:'Canada', lat:43.6426, long:79.3871)
    assert_not property.save
  end
  test "should not save property without city" do
    property = Property.new(name:"CN Tower", street_address:"290 Bremner Blvd, Toronto", city:"", country:'Canada', lat:43.6426, long:79.3871)
    assert_not property.save
  end
  test "should not save property without country" do
    property = Property.new(name:"CN Tower", street_address:"290 Bremner Blvd, Toronto", city:"Toronto", country:'', lat:43.6426, long:79.3871)
    assert_not property.save
  end
  test "should not save property without latitude" do
    property = Property.new(name:"CN Tower", street_address:"290 Bremner Blvd, Toronto", city:"Toronto", country:'Canada', lat:'', long:79.3871)
    assert_not property.save
  end
  test "should not save property without longitude" do
    property = Property.new(name:"CN Tower", street_address:"290 Bremner Blvd, Toronto", city:"Toronto", country:'Canada', lat:43.6426, long:'')
    assert_not property.save
  end

  # Tests that lattitude over 90 wont save
  test "should not save property with lattitude over 90" do
    property = Property.new(name:"CN Tower", street_address:"290 Bremner Blvd, Toronto", city:"Toronto", country:'Canada', lat:90.1, long:79.3871)
    assert_not property.save
  end

  # Tests that lattitude under -90 wont save
  test "should not save property with lattitude under -90" do
      property = Property.new(name:"CN Tower", street_address:"290 Bremner Blvd, Toronto", city:"Toronto", country:'Canada', lat:-90.1, long:79.3871)
      assert_not property.save
    end

  # Tests that longitude over 180 wont save
  test "should not save property with longitude over 180" do
    property = Property.new(name:"CN Tower", street_address:"290 Bremner Blvd, Toronto", city:"Toronto", country:'Canada', lat:43.6426, long:180.1)
    assert_not property.save
  end

  # Tests that longitude under -180 wont save
  test "should not save property with longistude under -180" do
      property = Property.new(name:"CN Tower", street_address:"290 Bremner Blvd, Toronto", city:"Toronto", country:'Canada', lat:43.6426, long:-180.1)
      assert_not property.save
    end



end
