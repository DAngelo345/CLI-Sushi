class Restaurant

    @@all = []
    

    def initialize(hash)
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