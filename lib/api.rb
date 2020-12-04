class API

URL = 'https://api.yelp.com/v3'

API_KEY = "eMl4J1JSZ7-hkriidh1zM6HSFZFKaGdiukrSg8ZMjGmO8okQajfpD2C24Zb57SvcHkhba2fkZsXq5edKaJKFAcK9MzQKemFy1RsimN5NA2o8_x4ofmP9WJSI-mPJX3Yx"

   

    def initialize(url)
        @url = url
 
    end


    def get_restaurants
        uri = URI.parse(@url)
        req = Net::HTTP::Get.new(uri)
        req['Authorization'] = "Bearer #{API_KEY}" 
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")
        response = http.request(req)
        restaurants = JSON(response.body)['businesses']
        restaurants.each do |r|
            Restaurant.new(r)
        end
        # res = Net::HTTP.start(uri.hostname, uri.port) {|http| http.request(req)}
        # formatted_res = JSON(res.body)
        binding.pry
    end

end