# frozen_string_literal: true

require 'test_helper'

class SlotsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get slots_index_url
    assert_response :success
  end

  test 'should get create' do
    get slots_create_url
    assert_response :success
  end

  test 'should get load_game' do
    get slots_load_game_url
    assert_response :success
  end
end
