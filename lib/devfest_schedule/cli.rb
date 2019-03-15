class DevfestSchedule::CLI

    @@display_array = []
    @@description_array = []
    ## Test for now. Will be hash {time:talk}
    #@@user_schedule = []

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
    end

    def welcome
        puts "Welcome to the DevFest Talks Schedule CLI."
        puts "Please select a talk from below to build your schedule and for further description:"
        display_dev_schedule 
    end

    def display_dev_schedule
        counter = 1
        DevfestSchedule::Talk.all.each do |talk|
            puts "#{counter}. #{talk.start_time} -#{talk.end_time} - #{talk.title} By: #{talk.speaker}"
            counter+=1
        end
        user_interaction
    end

    ### Access via input conversion to array index.
    def display_description(selected_index)
        DevfestSchedule::Talk.all[selected_index-1].description
    end

    def user_interaction
        talk_selection_input = nil
        replace_input = nil
        ### Exit command test
    
        puts "Select which talk you would like more information on by number or type 'exit' to quit:"
            talk_selection_input = (gets.strip).to_i
        # if talk_selection_input == "exit"
        #     exit_program
        # else
        #while talk_selection_input != "exit"
#while talk_selection_input != exit
        if talk_selection_input.to_i >= 1 && talk_selection_input.to_i < 18
            puts "Description:"
            puts display_description(talk_selection_input)
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
                            if DevfestSchedule::Talk.all[talk_selection_input-1].start_time == slot_time
                                @@user_schedule[slot_time]= talk = "#{DevfestSchedule::Talk.all[talk_selection_input-1].title}, By: #{DevfestSchedule::Talk.all[talk_selection_input-1].speaker}"
                                #binding.pry
                            end
                        elsif replace_input == "n"
                            puts "Okay. Returning to menu."
                            display_dev_schedule
                        else
                            puts "Invalid entry. Please try again."
                        end
                    else
                        if DevfestSchedule::Talk.all[talk_selection_input-1].start_time == slot_time
                            @@user_schedule[slot_time]= talk = "#{DevfestSchedule::Talk.all[talk_selection_input-1].title}, By: #{DevfestSchedule::Talk.all[talk_selection_input-1].speaker}"
                            #@@user_schedule[slot_time]= talk = DevfestSchedule::Talk.all[talk_selection_input-1]
                            #binding.pry
                        end
                    end
                end
                #binding.pry
                puts @@user_schedule
## Uncomment when exit command created.
                display_dev_schedule
            elsif entry_input == "n"
                puts "Okay. Returning to menu."
                
                display_dev_schedule
            else
                puts "Invalid entry. Returning to menu."
                # need better return to menu
                display_dev_schedule
            end
        else 
            puts "Not a valid entry. Please try again."
            # need better return to menu
            display_dev_schedule
        end
    # While exit end
        end
    
   # end
    def exit_program
        puts "Thank you for using the Devfest Schedule CLI."
        puts "Have a nice day!"
    end
    ## Presents devfest schedule. Let's user see further description.
    ## Has user select which talks to go to depending on time block.
    ## If user's schedule hash already has block inside. Warns user there is already a talk selected.
    ## Gives user option to replace talk with new selection.

end