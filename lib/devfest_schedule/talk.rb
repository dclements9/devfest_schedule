#class DevfestSchedule::Talk
require 'pry'
require 'nokogiri'
require 'open-uri'
require 'pry-byebug'

class Talks
    attr_accessor :title, :speaker, :description, :start_time, :end_time, :session_id
    @@all = []

    def initialize
        @@all << self
    end

    def self.scrape_talks   
        schedule = Nokogiri::HTML(open("https://devfest.gdgcapitalregion.com/schedule/"))
        schedule.css("div.slot.col-md-4.col-xs-12.flexbox-item-height").each do |element|  
            talk = self.new
            if element.css("h5.slot-title").text != ""     
                talk.title = element.css("h5.slot-title").text
                talk.speaker = element.css("p.speaker-name").text 
                if element.attribute('id') != nil
                    talk.session_id = element.attribute('id').value
                end
            end
            ## Instance tests
            #binding.pry
           talk
        end    
        ## Test @@all
        binding.pry  
    end
## Testing method by calling
scrape_talks
end

### Session detail label = same for description && speaker session
### Times: 
    # @schedule.css("div.timeslot").each do |element| 
    # talk.start_time = (element.css("time.start-time").attribute("datetime").value).gsub('T', " ")
    # talk.end_time = (element.css("time.end-time").attribute("datetime").value).gsub('T', " ")