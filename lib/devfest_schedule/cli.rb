class DevfestSchedule::CLI

    def call
        welcome
    end

    def welcome
        puts "Welcome to the DevFest Talks Schedule CLI."
        puts "Please select a talk from below to build your schedule or for a further description."
    end

    ### Presents schedule. Let's user see further description.
    ### Has user select which talks to go to depending on time block.
    ### If user's schedule hash already has block inside. Warns user there is already a talk selected.
    ### Gives user option to replace talk with new selection.

end