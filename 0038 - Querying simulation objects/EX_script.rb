# Select database from this path

$project_path = File.dirname(FILE)
$db_name = "2021.1.1_Standalone.icmm"
$db_file = "#{$project_path}/#{$db_name}"
$db = WSApplication.open $db_file, false

def find_name(type, id)
	$db.model_object_from_type_and_id(type, id).name
	end

# Start script
model_group = $db.model_object '>MODG~Model group'

model_group.children.each do |model_run|
	case model_run.type
	when 'Run'
	# Get the ID of the model network, level, and rainfall events for this run
	net_id = model_run['Model Network']
	lev_id = model_run['Level']
	commit = model_run['Model Network Commit ID']
	rainfalls = []
	model_run.children.each { |sim| rainfalls << sim['Rainfall event'] }

		# Print the parameters for this run
		puts "Run parameters:"
		puts "=> Model network name: #{find_name('Model network', net_id)}"
		puts "=> Model commit version: #{commit}"
		puts "=> Level file used: #{find_name('Level', lev_id)}"
		rainfalls.each do |rain_id|
		puts "=> Rainfall file: #{find_name('Rainfall Event', rain_id)}"
		end
		puts "=> Simulation duration: #{model_run['Duration']}"
	end
end



