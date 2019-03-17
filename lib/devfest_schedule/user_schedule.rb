class DevfestSchedule::UserSchedule

    @@schedule = {"9:30" => nil,
        "10:30" => nil,
        "11:30" => nil,
        "2:00" => nil,
        "3:00" => nil,
        "4:00" => nil}
        
    def self.add(talk)
        schedule.each do |slot_time, slot|
            if talk.start_time == slot_time
                schedule[slot_time] = talk.title
            end
        end
    end

    def self.schedule
        @@schedule
    end

    def self.view
        puts "Your schedule: "
        schedule.each do |time_slot, talk|
            puts "#{time_slot}: #{schedule[time_slot]}"
        end
    end
end