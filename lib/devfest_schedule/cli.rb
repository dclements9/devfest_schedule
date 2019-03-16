class DevfestSchedule::CLI

### TODO: View method for user_schedule
### && seperate selection input interaction method.
    @@display_array = []
    @@description_array = []

    @@user_schedule = {"9:30" => nil,
        "10:30" => nil,
        "11:30" => nil,
        "2:00" => nil,
        "3:00" => nil,
        "4:00" => nil}
  
# 930 - 1020
# 1030 -1120
# 1130 - 1220
# 200 - 250
# 300 - 350
# 400 - 450

    def call
        welcome
        display_dev_schedule
    end

    def welcome
        puts "Welcome to the DevFest Talks Schedule CLI."
        puts "Please select a talk from below to build your schedule and for further description:"
    end

    def display_dev_schedule
        counter = 1
        DevfestSchedule::Talk.all.each do |talk|
            puts "#{counter}. #{talk.start_time} - #{talk.end_time} - #{talk.title} By: #{talk.speaker}"
            counter+=1
        end
        user_interaction
    end

    def view
        puts "Your schedule: "
        @@user_schedule.each do |time_slot, talk|
            #binding.pry
            #Invalid method?
            #puts "#{time_slot}, #{talk.title} By: #{talk.speaker}"
            object = @@user_schedule[time_slot]
            puts object
        end
    end

    ### Access via input conversion to array index.
    def display_description(selected_index)
        DevfestSchedule::Talk.all[selected_index-1].description
    end

    def user_interaction
        talk_selection_input = nil
        replace_input = nil
    
        puts "Select which talk you would like more information on by number or type 'exit' to quit:"
            talk_selection_input = gets.strip
        if talk_selection_input == "exit"
            exit_program
        elsif talk_selection_input.to_i >= 1 && talk_selection_input.to_i < 18
            ## Seperate method?
            puts "Description:"
            puts display_description(talk_selection_input.to_i)
            puts "Would you like to put this in your schedule? (y/n)"
            entry_input = gets.strip.downcase
            if entry_input == "y"
                #binding.pry
                @@user_schedule.each do |slot_time, talk|
                    #binding.pry
                    if talk != nil 
                        puts "This time slot has already been filled."
                        puts "Would you like to replace this slot time? (y/n)"
                        replace_input = gets.strip.downcase
                        if replace_input == "y"
                            if DevfestSchedule::Talk.all[talk_selection_input.to_i-1].start_time == slot_time
                                @@user_schedule[slot_time]= talk = DevfestSchedule::Talk.all[talk_selection_input.to_i-1]
                                #binding.pry
                            end
                        elsif replace_input == "n"
                            puts "Okay. Returning to menu."
                            display_dev_schedule
                        else
                            puts "Invalid entry. Please try again."
                        end
                    else
                        if DevfestSchedule::Talk.all[talk_selection_input.to_i-1].start_time == slot_time
                            @@user_schedule[slot_time]= talk = DevfestSchedule::Talk.all[talk_selection_input.to_i-1]
                            
                            #binding.pry
                        end
                    end
                end
                #binding.pry
            ## necessary?    
                talk_selection_input = nil
                view
                display_dev_schedule
            elsif entry_input == "n"
                puts "Okay. Returning to menu."
                display_dev_schedule
            else
                puts "Invalid entry. Returning to menu."

                display_dev_schedule
            end
        else 
            puts "Not a valid entry. Please try again."
            user_interaction
        end
    end

    def exit_program
        puts "Thank you for using the Devfest Schedule CLI."
        puts "Have a nice day!"
    end

end