require 'fileutils'

open_net = WSApplication.current_network

# Prompt user for a folder
folder = WSApplication.folder_dialog 'Select a folder to import files',  true

if folder.nil?
  puts "No folder was selected. Exiting program."
else
  # Do something with the selected folder
end