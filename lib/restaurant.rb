class Restaurant
    # attr_accessor :name, :is_closed, :image_url

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

    def display_info
            puts "#{self.id}"
            puts "Name: #{self.name}"
            puts "Phone number: #{self.phone}"
            puts "Location: #{self.location}"
            puts "Is_closed?: #{self.is_closed?}"
            puts "price: #{self.price}"
    end

     def is_closed?
            if !self.is_closed? 
                puts "open"
            else 
                puts "closed"
            end
    end

    def save
        self.class.all << self
    end
    
    def self.all
        @@all
    end
        

end