#class DevfestSchedule::Talk
require 'pry'
require 'nokogiri'
require 'open-uri'

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
                    session_id = element.attribute('id').value
                    ## Grab only digits - Not gsub method
                    talk.session_id = session_id.gsub(/\D/, "")
                end
             end
           descriptions_modal = schedule.search("div.modals")
        
           descriptions_modal.css("div.modal.fade.text-left.people-modal").each do |modal|

           if modal.attribute('id') != nil
               ## Need torefactor @@all to class method
               @@all.each do |object|
                if description_id = modal.attribute('id').value.gsub(/\D/, "") === talk.session_id
                    talk.description = modal.css("p.theme-description").text
                end
               end
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
    # schedule.search("")
    # @schedule.css("div.timeslot").each do |element| 
    # talk.start_time = (element.css("time.start-time").attribute("datetime").value).gsub('T', " ")
    # talk.end_time = (element.css("time.end-time").attribute("datetime").value).gsub('T', " ")