class CLI
    
    attr_reader :full_restaurants, :filtered_restaurants
    def start
        puts ""
        puts "Welcome to Sushi Time"
        menu
    end

    def menu
        puts ""                                                                                         
        puts "Please place your zip code in the section below to find a sushi restaurant near you."    
        input = gets.strip.downcase
        @full_restaurants = API.new("https://api.yelp.com/v3/businesses/search?term=sushi&location=#{input}").get_restaurants
        # binding.pry
        if full_restaurants
            list_of_restaurants(full_restaurants)
            user_input_for_ratings
            user_input_filtered_list
            
        else
            puts "We didn't find a matching zip code."
            menu
        end
    end

    def restaurant_selector_full(input)
        restaurant = full_restaurants[input.to_i - 1]
        restaurant.display_info
    end
    
    def restaurant_selector_filtered(input)
        restaurant = filtered_restaurants[input.to_i - 1]
        restaurant.display_info
    end

    def list_of_restaurants(restaurants)
        # binding.pry
        restaurants.each.with_index(1) do |r, i|        #zip codes = 46774, 46540, 33101
            puts "#{i}. #{r.name}"
        end
    end

    # def rating_selector(input)
        
    #         Restaurant.rating_more_than(input)
        
    # end

    def user_input_for_ratings
        
        puts ""
        puts "choose a number from 1.0 - 5.0 stars and see restaruants with that rating or higher. if not type exit. "
        puts ""
        prompt = "> "
        print prompt
        user_input = gets.chomp.to_f
        if user_input.to_i.between?(1, 5)
            @filtered_restaurants = Restaurant.rating_more_than(user_input)
            list_of_restaurants(filtered_restaurants)
        elsif user_input == "exit"
            puts ""
            return goodbye 
            puts ""
        else
            puts ""
            puts "Invalid input, please enter 1.0 - 5.0 or exit"
            puts ""
            user_input_for_ratings
        end
    end

    def user_input_filtered_list
        puts "___________________"
        puts ""
        puts"Would you like to see the more info about a particular restaurant in the list?"
        puts ""
        puts "Enter the 'number' of the restaurant you'd like to know more about, or 'no' if you'd like to go back to the zip code selection or 'exit' to exit"
        puts ""
        prompt = "> "
        print prompt
        user_input = gets.strip.downcase
        if user_input.to_i.between?(1, filtered_restaurants.length)
            puts ""
            puts "Enter the number next to the restaurant you'd like to know more about"
            puts ""
            restaurant_selector_filtered(user_input)
            previous_method
        elsif user_input == "no" 
            puts ""
            menu
            puts ""
        elsif user_input == "exit"
            return goodbye
        else
            puts ""
            puts "Invalid input!"
            puts ""
            list_of_restaurants(filtered_restaurants)
            user_input_filtered_list
        end
    end

    def user_input_full_list
        puts "___________________"
        puts ""
        puts"Would you like to see the more info about a particular restaurant in the list?"
        puts ""
        puts "Enter the 'number' of the restaurant you'd like to know more about, or 'no' if you'd like to go back to the zip code selection or 'exit' to exit"
        puts ""
        prompt = "> "
        print prompt
        user_input = gets.strip.downcase
        if user_input.to_i.between?(1, full_restaurants.length)
            puts ""
            puts "Enter the number next to the restaurant you'd like to know more about"
            puts ""
            restaurant_selector_full(user_input)
            previous_method
        elsif user_input == "no" 
            puts ""
            menu
            puts ""
        elsif user_input == "exit"
            return goodbye
        else
            puts ""
            puts "Invalid input, please enter a number /no, exit"
            puts ""
            list_of_restaurants(full_restaurants)
            user_input_full_list 
        end
    end

    def previous_method
        puts ""
        puts "would you like to go back to the full list of restaurants or the filtered list or menu to choose a new zip code ?"
        puts ""
        puts "Enter full, filtered, menu or  no to exit"
        puts ""
        prompt = "> "
        print prompt
        while user_input = gets.strip.downcase
            case user_input
            when "full"
                self.list_of_restaurants(full_restaurants)
                user_input_for_ratings
                user_input_filtered_list
                break
            when "filtered"
                self.list_of_restaurants(filtered_restaurants)
                user_input_filtered_list
                break
            when "menu"
                menu 
                break
            when "no"
                puts ""
                return goodbye
            else
                puts ""
                puts "Please enter full, filtered or no"
                puts "" 
                print prompt
            end
        end
    end


    def goodbye
        puts "Thanks for using Sushi Time"
        puts ""
    end
end

