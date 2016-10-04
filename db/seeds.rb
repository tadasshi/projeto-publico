# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:email => "yuddiy_japa@hotmail.com", :password => "12345678", :password_confirmation => "12345678")
User.create(:email => "tadasshi@gmail.com", :password => "12345678", :password_confirmation => "12345678")

Admin.create(:email => "yuddiy_japa@hotmail.com", :password => "12345678", :password_confirmation => "12345678")
Admin.create(:email => "tadasshi@gmail.com", :password => "12345678", :password_confirmation => "12345678")

require 'net/http'
require 'net/https' # for ruby 1.8.7
require 'json'

module BRPopulate
  def self.states
    http = Net::HTTP.new('raw.githubusercontent.com', 443); http.use_ssl = true
    JSON.parse http.get('/celsodantas/br_populate/master/states.json').body
  end

  def self.capital?(city, state)
    city["name"] == state["capital"]
  end

  def self.populate
    states.each do |state|
      region_obj = Region.find_or_create_by(:name => state["region"])
      state_obj = State.new(:acronym => state["acronym"], :name => state["name"], :region => region_obj)
      state_obj.save

      state["cities"].each do |city|
        c = City.new
        c.name = city["name"]
        c.state = state_obj
        c.capital = capital?(city, state)
        c.save
      end
    end
  end
end

BRPopulate.populate