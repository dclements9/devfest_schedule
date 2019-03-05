#class DevfestSchedule::Talk
require 'pry'
require 'nokogiri'
require 'open-uri'

class Talks
    attr_accessor :title, :speaker
    #binding.pry
    def self.scrape_talks
        schedule = Nokogiri::HTML(open("https://devfest.gdgcapitalregion.com/schedule/"))
            #schedule.css("div.content-wrapper timeslot").each do |element|
            #schedule.css("div.content-wrapper timeslot").each do |element|
            schedule.css("div.schedule-table col-lg-8 col-md-10 col-md-offset-1 ui-draggable ui-draggable-handle").each do |element|
                binding.pry
        talk = self.new
        talk.title = element.css("div.timeslot").text
        puts talk.title
        #talk.title = element.css("h5.slot-title").text
        #talk.title = schedule.search("h5.slot-title").text
        # talk.speaker = schedule.search("p.speaker").text
        # #<p class="speaker-name">Becca Kennedy <span class="speaker-position">Agrilyst &amp; Kennason</span> </p>
        # # talk.description =  
         talk
            end
            #binding.pry
    end
binding.pry
end