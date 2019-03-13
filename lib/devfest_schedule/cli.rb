class DevfestSchedule::CLI

    @@display_array = []
    @@description_array = []
    ## Test for now. Will be hash {time:talk}
    @@user_schedule = []

    def call
        welcome
    end

    def welcome
        puts "Welcome to the DevFest Talks Schedule CLI."
        puts "Please select a talk from below to build your schedule and for further description."
        # Displays Time, Title, By Speaker, & Option for further description(Next Level).
        display_dev_schedule 
    end

    def display_dev_schedule
        ## TODO: Seperate display from rest of method in seperate method.
        DevfestSchedule::Talk.all.each do |talk|
            @@display_array << "#{talk.start_time} -#{talk.end_time} - #{talk.title} By: #{talk.speaker}"
            @@description_array << "#{talk.description}"
        end
        ## Displays array values with index 
        @@display_array.each.with_index(1) {|talk, i| puts "#{i}. #{talk} "}

        puts "Select which talk you would like more information on by number:"
        talk_selection_input = (gets.strip).to_i

        ### Test for working. Need seperate method?
        if talk_selection_input.to_i >= 1 && talk_selection_input.to_i < 18
            puts "Description: #{@@description_array[talk_selection_input-1]}"
            puts "Would you like to put this in your schedule? (y/n)"
            entry_input = gets.strip.downcase
            if entry_input == "y"
                @@user_schedule << @@display_array[talk_selection_input-1]


                # @@user_schedule.map do |time_slot, talk|
                #     ## Possibly need talk selection to be hash?
                #     if time_slot == ?
                #         talk = @@display_array[talk_selection_input-1]
                #     end
                # end


                puts @@user_schedule
            elsif entry_input == "n"
                puts "Okay. Returning to menu."
                
                display_dev_schedule
            else
                "Invalid entry. Returning to menu."
                # need better return to menu
                display_dev_schedule
            end
        else 
            puts "Not a valid entry. Please try again."
            # need better return to menu
            display_dev_schedule
        end
    end

    ## Presents devfest schedule. Let's user see further description.
    ## Has user select which talks to go to depending on time block.
    ## If user's schedule hash already has block inside. Warns user there is already a talk selected.
    ## Gives user option to replace talk with new selection.

end