require 'test_helper'

class WeatherAppControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weather_app_index_url
    assert_response :success
  end

end
