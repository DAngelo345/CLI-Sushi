class CLI

    def start
        # API.new("https://api.yelp.com/v3/businesses/search?location=NYC").get_restaurants
        puts "Welcome to Sushi Time"
        call
    end

    def call 
        puts ""
        puts "Please place your zip code in the section below to find a sushi restaurant near you."
        
        menu
    end

    def menu
        puts ""
        input = gets.strip
            # "City #{address}, State #{address}
        API.new("https://api.yelp.com/v3/businesses/search?term=sushi&location=#{input}").get_restaurants
        list_of_restaurants
        puts "___________________"
        puts""
        # puts "Type in the number of that restaurant to find out the phone number, location and rating of that restaurant."
        puts "Would you like to see the sushi restaurants with the best ratings?"
        puts ""
        puts "Enter yes or no"
        puts ""
        input = gets.strip.downcase
        if input == "yes"
            puts "___________________"
            puts ""
            phone_number
        elsif input == "no"
            puts "Thanks for using Sushi Time"
        end
    end
    
    def list_of_restaurants
        restaurants = Restaurant.all
        restaurants.each.with_index(1) do |r, i|        #zip codes = 46774, 46540, 33101
            puts "#{i}. #{r.name}"
        end
    end

    def rating
        with_rating = Restaurant.all #list_of_restaurants
        with_rating.each do |r|
            # binding.pry   
            puts "#{r.rating}"
        end
    end

    def restaurants_selector
        puts "Enter the number next to the restaurant you'd like to know more about"
        input = get.strip.downcase
        num_input = input.to_i
        # Restaurant.all.select do |number|
        #     number.artist == self
        end
    end

    def phone_number
        restaurants = Restaurant.all
        restaurants.each do |r|        
            puts "#{r.phone}"
        end
    end

    def location
        restaurants = Restaurant.all
        restaurants.each do |r| 
            puts "#{r.location}" 
        end     
    end

    def is_closed
        restaurants = Restaurant.all
        restaurants.each do |r| 
            "#{r.is_closed}" 
            # binding.pry
            if r.is_closed == false
                puts "open"
            elsif r.is_closed == true
                puts "closed"
            end
        end
    end

    def price
        restaurants = Restaurant.all
        restaurants.each do |r| 
            puts "#{r.price}" 
        end
    end
end