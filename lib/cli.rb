class CLI

    def start
        API.new("https://api.yelp.com/v3/businesses/search?location=NYC").get_restaurants
    end
    
end