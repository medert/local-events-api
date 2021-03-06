require 'net/http'
require 'pry'
require 'json'

city = "Boston"
state = "MA"
today = Time.now.strftime("%Y-%m-%d")

url = "http://api.seatgeek.com/2/events"
url += "?venue.city=#{city}"
# url += "&venue.state=#{state}"
# # url += "&datetime_local.gte=#{date}"
# # url += "&datetime_local.gte=#{date}"
# url += "&datetime_local.gte=2015-12-01"
# url += "&datetime_local.lt=2015-12-02"

uri = URI("http://api.seatgeek.com/2/events?venue.city=Boston&venue.state=MA&datetime_local.gte=2015-12-09&datetime_local.lt=2015-12-9")

response = Net::HTTP.get_response(uri)

events = JSON.parse(response.body)["events"]

events.each do |event|
  puts "#{event["title"]} @ #{event["venue"]["name"]}"
end
#
