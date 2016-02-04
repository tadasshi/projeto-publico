class AddAdminUser < ActiveRecord::Migration
  def change
    User.create(:email => "yuddiy_japa@hotmail.com", :password => "12345678", :password_confirmation => "12345678")
    User.create(:email => "tadasshi@gmail.com", :password => "12345678", :password_confirmation => "12345678")
  end
end
