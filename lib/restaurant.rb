class Restaurant
    attr_accessor :name, :is_closed, :image_url

    @@all = []
    

    def initialize(hash)
        # binding.pry
        hash.each do |k, v|
            self.class.attr_accessor k
            self.send("#{k}=",v)
        end 
        save
    end

    def self.find_by_index(input)
        all.select do |rest|
          rest.id == input
        end
    end 

    def is_closed?
        if !self.is_closed 
            puts "open"
        else 
            puts "closed"
        end
    end

    def self.poorly_rated_restaurants
        #This method will return an array of Restaurant objects that have a rating below 3.5
        array = []
        Restaurant.all.each do |restaurant|
            if restaurant.rating < 3.5 
               array << restaurant
            end
           end
           array
    end

    # def self.rating_more_than(rating_argument)
    #      Restaurant.all.select { |restaurant| restaurant.rating >= rating_argument }
    #      
    # end

    def self.rating_more_than(rating_argument)
        array = []
        Restaurant.all.each do |r|
       
            if r.rating >= rating_argument
                array << r
            end
        end
        array.sort_by(&:rating).reverse 
    end
    

    # Restaurant.rating_less_than(4.2)
     # Restaurant.rating_less_than(3.6)


    def self.heavily_reviewed_restaurants
        # THis method will return an array of Restaurant objects that have more than 500 reviews
        array = []
                Restaurant.all.each do |r|
             if r.review_count >= 500 
                array << r
             end
            end
            array        
    end

    def display_info
            puts "Id: #{self.id}"
            puts "Name: #{self.name}"
            puts "Phone number: #{self.phone}"
            puts "Location: #{self.location}"
            puts "Price: #{self.price}"
            puts "Rating: #{self.rating}"
            puts "#{self.is_closed?}"
            # puts "#{self.is_closed?}"
    end

    def save
        self.class.all << self
    end
    
    def self.all
        @@all
    end
        

end