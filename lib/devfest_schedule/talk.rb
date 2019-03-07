#class DevfestSchedule::Talk
require 'pry'
require 'nokogiri'
require 'open-uri'

class Talks
    attr_accessor :title, :speaker, :description, :start_time, :end_time
    @@all = []

    def initialize
        @@all << self
    end
    #binding.pry
    def self.scrape_talks
        schedule = Nokogiri::HTML(open("https://devfest.gdgcapitalregion.com/schedule/"))
        
        schedule.css("div.timeslot").each do |element|   
           # binding.pry       
            talk = self.new
            talk.title = element.css("h5.slot-title").text
            #talk.speaker = element.at_css("p.speaker-name").text
            talk.speaker = element.css("p.speaker-name").text

            #talk.start_time = element.css("time.start-time")
            #talk.start_time = element.css("time.start-time").attribute("datetime")
            talk.start_time = element.css("time.start-time datetime").values
            #binding.pry
        
            schedule.css("div.modals").each do |descriptions|
                talk.description = element.css("p.theme-description").text
        end
        #binding.pry
        talk
    end
        
        #Test @@all
        binding.pry  
    end
#Testing method by calling
scrape_talks
end