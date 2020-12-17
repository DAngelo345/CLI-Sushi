class CLI
    attr_reader :restaurants

    def start
        # API.new("https://api.yelp.com/v3/businesses/search?location=NYC").get_restaurants
        puts ""
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
        input = gets.strip.downcase
            # "City #{address}, State #{address}
        API.new("https://api.yelp.com/v3/businesses/search?term=sushi&location=#{input}").get_restaurants
        @restaurants = Restaurant.all
        list_of_restaurants
        restaurant_selector        
    end
 
    def restaurant_selector
        input = gets.strip.to_i
        if input.between?(1, restaurants.length)
            restaurant = restaurants[input - 1]
            restaurant.display_info
        else
            puts " wrong inupt try again"
            restaurant_selector
        end 
    end
    
    def list_of_restaurants
        restaurants.each.with_index(1) do |r, i|        #zip codes = 46774, 46540, 33101
            puts "#{i}. #{r.name}"
        end
            puts "___________________"
            puts ""
            puts"Would you like to see the more info about a particular restaurant in the list?"
            puts ""
            puts "Enter yes or no"
        puts ""
        prompt = "> "
        print prompt
        while user_input = gets.strip.downcase
            case user_input
            when "yes"
                puts ""
                puts "Enter the number next to the restaurant you'd like to know more about"
                puts ""
                break
            when "no" 
                puts ""
                puts "Thanks for using Sushi Time"
                puts ""
                break
            else
                puts ""
                puts "Please enter yes or no" 
                print prompt
            end    
    end


    end
end

    # def phone
    #     restaurants = Restaurant.all
    #     restaurants.each do |r|        
    #         puts "#{r.phone}"
    #     end
    # end

    # def location
    #     restaurants = Restaurant.all
    #     restaurants.each do |r| 
    #         puts "#{r.location}" 
    #     end     
    # end

    # def price
    #     restaurants = Restaurant.all
    #     restaurants.each do |r| 
    #         puts "#{r.price}" 
    #     end
    # end

    # def rating
    #     with_rating = Restaurant.all #list_of_restaurants
    #     with_rating.each do |r|
    #         # binding.pry   
    #         puts "#{r.rating}"
    #     end
    # end
    
  