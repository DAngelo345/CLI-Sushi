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

    def save
        self.class.all << self
    end
    
    def self.all
        @@all
    end
        

end