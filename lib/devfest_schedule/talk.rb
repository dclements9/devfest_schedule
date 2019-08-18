class DevfestSchedule::Talk

    attr_accessor :title, :speaker, :description, :start_time, :end_time, :session_id
    @@all = []
    
    def initialize
        @@all << self
    end

    def self.all
        @@all
    end
### Title, Speaker, & Session ID (For Description comparison to assign)
    def self.scrape_talks
        
        schedule = Nokogiri::HTML(open("https://devfest18.gdgcapitalregion.com/"))
        schedule.css("div.slot.col-md-4.col-xs-12.flexbox-item-height").each do |element| 

            if (element.css("h5.slot-title").text != "") && (element.css("h5.slot-title").text != "No Speaker")
                talk = self.new
                talk.title = element.css("h5.slot-title").text
                talk.speaker = element.css("p.speaker-name").text 
                if element.attribute('id') != nil
                    talk.session_id = element.attribute('id').value
                    talk.session_id = talk.session_id.gsub(/\D/, "")
                end
            end
### Descriptions
           descriptions_modal = schedule.search("div.modals")
        
           descriptions_modal.css("div.modal.fade.text-left.people-modal").each do |modal|
           if modal.attribute('id') != nil
                all.each do |object|
                    if (talk != nil) && (modal.attribute('id').value.gsub(/\D/, "") === talk.session_id)
                        talk.description = modal.css("p.theme-description").text
                    end
               end
           end
       end
### Times: 
    time_parse = schedule.search("div.schedule-table.col-lg-8.col-md-10.col-md-offset-1")
    time_parse.css("div.timeslot").each do |time| 
        if  time.css("h5.slot-title").text != nil
            all.each do |object|
                time.css("h5.slot-title").each do |slot_title|
                    if (talk != nil) && (slot_title.text === talk.title)
                        talk.start_time = (time.css("time.start-time").attribute("datetime").value).gsub('October 27T', "")
                        talk.end_time = (time.css("time.end-time").attribute("datetime").value).gsub('October 27T', "")
                    end
                end
            end 
       end
    end
        end    
    end 
    scrape_talks
end