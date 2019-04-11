class DevfestSchedule::CLI

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
        select_interaction
    end

    def display_description(selected_index)
        DevfestSchedule::Talk.all[selected_index-1].description
    end

    def select_interaction
        talk_selection_input = nil
        replace_input = nil
    
        puts "Select which talk you would like more information on by number or type 'exit' to quit:"
            talk_selection_input = gets.strip
        if talk_selection_input == "exit"
            exit_program
            
        #elsif talk_selection_input.to_i > 0 && talk_selection_input.to_i < 18
        elsif talk_selection_input.to_i.between?(0,18) 
            add_interaction(talk_selection_input.to_i)
        else 
            puts "Not a valid entry. Please try again."
            select_interaction
        end
    end

    def add_interaction(selection_input)
        puts "Description:"
        puts display_description(selection_input)
        puts "Would you like to put this in your schedule? (y/n)"
        entry_input = gets.strip.downcase
        if entry_input == "y"
            DevfestSchedule::UserSchedule.schedule.each do |slot_time, talk|

# User Schedule add point 
                DevfestSchedule::UserSchedule.add (DevfestSchedule::Talk.all[selection_input-1])                                     
            end
            selection_input = nil
            DevfestSchedule::UserSchedule.view
            display_dev_schedule
        elsif entry_input == "n"
            puts "Okay. Returning to menu."
            display_dev_schedule
        else
            puts "Invalid entry. Returning to menu."
            display_dev_schedule
        end
    end

    def exit_program
        puts "Thank you for using the Devfest Schedule CLI."
        puts "Have a nice day!"
    end
end