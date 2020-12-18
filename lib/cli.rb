class CLI
    attr_reader :restaurants

    def start
        # API.new("https://api.yelp.com/v3/businesses/search?location=NYC").get_restaurants
        puts ""
        puts "Welcome to Sushi Time"
        menu
    end

    # def call 
    #     # puts ""
    #     # puts "Please place your zip code in the section below to find a sushi restaurant near you."
    #     menu
    # end

    def menu
        puts ""                                                                                         #error when zip code doesnt exsit
        puts "Please place your zip code in the section below to find a sushi restaurant near you."     #asks for zip code and previous page extra times before breaking.
        puts ""
        input = gets.strip.downcase
            # "City #{address}, State #{address}
            # @restaurants = Restaurant.all
        @restaurants = API.new("https://api.yelp.com/v3/businesses/search?term=sushi&location=#{input}").get_restaurants
        if restaurants
            list_of_restaurants
            user_input_2
        else
            puts "We didn't find a matching zip code."
            menu
        end
    
        # restaurant_selector
        # previous_method
             
    end
 
    def restaurant_selector
       
            restaurant = restaurants[input - 1]
            restaurant.display_info
    end
    
    def list_of_restaurants
        restaurants.each.with_index(1) do |r, i|        #zip codes = 46774, 46540, 33101
            puts "#{i}. #{r.name}"
        end
    end

    def user_input_2
        puts "___________________"
        puts ""
        puts"Would you like to see the more info about a particular restaurant in the list?"
        puts ""
        puts "Enter the 'number' of the restaurant you'd like to know more about, or 'no' if you'd like to go back to the zip code selection or 'exit' to exit"
        puts ""
        prompt = "> "
        print prompt
        user_input = gets.strip.downcase
        # while user_input != "exit"
            case user_input
            when user_input.to_i.between?(1, restaurants.length)
                puts ""
                puts "Enter the number next to the restaurant you'd like to know more about"
                puts ""
                restaurant_selector
                previous_method
                
            when "no" 
                puts ""
                # puts "Thanks for using Sushi Time!"
                menu
                puts ""

            when "exit"
                return goodbye
                
            else
                puts ""
                puts "Invalid input, please enter yes/no, exit"
                puts ""
                user_input_2
            end
    end

    def previous_method
        puts ""
        puts "would you like to go back to the previous list of restaurants?"
        puts ""
            puts "Enter yes or no to exit"
        puts ""
        prompt = "> "
        print prompt
        while user_input = gets.strip.downcase
            case user_input
            when "yes"
                self.list_of_restaurants
                user_input_2
                break
            when "no"
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

    def goodbye
        puts "Thanks for using Sushi Time"
    end

    
end
    
    
  