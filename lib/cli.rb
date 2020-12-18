class CLI
    attr_reader :restaurants

    def start
        # API.new("https://api.yelp.com/v3/businesses/search?location=NYC").get_restaurants
        puts ""
        puts "Welcome to Sushi Time"
        call
    end

    def call 
        # puts ""
        # puts "Please place your zip code in the section below to find a sushi restaurant near you."
        menu
    end

    def menu
        puts ""                                                                                         #error when zip code doesnt exsit
        puts "Please place your zip code in the section below to find a sushi restaurant near you."     #asks for zip code and previous page extra times before breaking.
        puts ""
        input = gets.strip.downcase
            # "City #{address}, State #{address}
        API.new("https://api.yelp.com/v3/businesses/search?term=sushi&location=#{input}").get_restaurants
        @restaurants = Restaurant.all
        list_of_restaurants
        previous_method
        # restaurant_selector
        # previous_method
             
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
                restaurant_selector
                # previous_method
                break
            when "no" 
                puts ""
                # puts "Thanks for using Sushi Time!"
                more_restaurants
                puts ""
                break
            else
                puts ""
                puts "Please enter yes or no"
                puts ""
                print prompt
            end
        end
       
    end

    def previous_method
        puts ""
        puts "would you like to go back to the previous list of restaurants?"
        puts ""
            puts "Enter yes or no"
        puts ""
        prompt = "> "
        print prompt
        while user_input = gets.strip.downcase
            case user_input
            when "yes"
                self.list_of_restaurants
                # previous_method
                break
            when "no"
                puts ""
                more_restaurants
                break
            else
                puts ""
                puts "Please enter yes or no"
                puts "" 
                print prompt
            end
            end
    end

    def more_restaurants
        puts "Would you like to see the more restaurants from a different zip code?"
        puts ""
            puts "Enter yes or no"
        puts ""
        prompt = "> "
        print prompt
        while user_input = gets.strip.downcase
            case user_input
            when "yes"
                menu
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
    
    
  