require 'FileUtils'

open_net = WSApplication.current_network

# Prompt user for a folder
cfg_dir = WSApplication.folder_dialog 'Select a folder to import files',  true 