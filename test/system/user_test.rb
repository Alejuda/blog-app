require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  test 'display users index' do
    visit users_path()
    assert_text 'name1'
    assert_text 'name2'
  end
end