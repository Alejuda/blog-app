require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup do
    User.create(name: "nacho", photo: "https://th.bing.com/th/id/OIP.xlTxIX_i9UIgOJtZCd01jwHaHa?pid=ImgDet&rs=1",bio: "test bio", posts_counter: 0)
    User.create(name: "gabriel", photo: "https://th.bing.com/th/id/OIP.xlTxIX_i9UIgOJtZCd01jwHaHa?pid=ImgDet&rs=1",bio: "test bio 2", posts_counter: 0)
  end
  test 'display all usernames' do
    
    visit users_path()
    assert_text 'nacho'
    assert_text 'gabriel'

  end
  test 'display all user images' do
    assert_selector('img', class: 'user-photo', count: 2)
  end
end