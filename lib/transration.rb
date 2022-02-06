require 'net/http'
require 'uri'
require 'json'

module Transration
    def self.translate(contents)
      url = URI.parse('https://translation.googleapis.com/language/translate/v2')
      key = ENV['GOOGLE_API_KEY']
      params = {
        q: contents,
        source: 'en',
        target: 'ja',
        key: key,
      }
      url.query = URI.encode_www_form(params)
      res = Net::HTTP.get_response(url)
      JSON.parse(res.body)['data']['translations'].first['translatedText']
    end
end



# fail
#GOOGLE_API_KEY='AIzaSyBS_-PNL6zVRjOG5GNEpiK24vfN513rPW8'
#url = <URI::HTTPS https://translation.googleapis.com/language/translate/v2?q=Food&source=en&target=ja&key=AIzaSyBS_-PNL6zVRjOG5GNEpiK24vfN513rPW8>
#params = {:q=>"Food", :source=>"en", :target=>"ja", :key=>"AIzaSyBS_-PNL6zVRjOG5GNEpiK24vfN513rPW8"}
#url.query = "q=Food&source=en&target=ja&key=AIzaSyBS_-PNL6zVRjOG5GNEpiK24vfN513rPW8"

# success
#url = <URI::HTTPS https://translation.googleapis.com/language/translate/v2?q=Food&source=en&target=ja&key=AIzaSyBS_-PNL6zVRjOG5GNEpiK24vfN513rPW8>
#params = {:q=>"Food", :source=>"en", :target=>"ja", :key=>"AIzaSyBS_-PNL6zVRjOG5GNEpiK24vfN513rPW8"}
#url.query = "q=Food&source=en&target=ja&key=AIzaSyBS_-PNL6zVRjOG5GNEpiK24vfN513rPW8"
