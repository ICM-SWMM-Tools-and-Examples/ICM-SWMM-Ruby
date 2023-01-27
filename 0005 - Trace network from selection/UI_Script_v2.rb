net = WSApplication.current_network

	#Get all subcatchments
	all_subs=net.row_objects('_subcatchments')

	#Create a empty hash variable
	node_sub_hash_map={}
	
	#Get all nodes 
	all_nodes=net.row_objects('_nodes')
	
	#Assign node ID's as hash keys
	all_nodes.each do |h|
		node_sub_hash_map[h.node_id]=[]
	end
	
	#Get all subcatchments
	all_subs=net.row_objects('_subcatchments')
	
	#Pair subcatchments to appropriate hash keys (i.e. node id's)
	all_subs.each do |subb|
		node_sub_hash_map[subb.node_id]<<subb
	end

roc = net.row_object_collection_selection('_nodes')
unprocessedLinks = Array.new
roc.each do |ro|
	ro.us_links.each do |l|
		if !l._seen
			unprocessedLinks << l
			l._seen=true
		end
	end
	while unprocessedLinks.size>0
		working = unprocessedLinks.shift
		working.selected=true
		workingUSNode = working.us_node
		if !workingUSNode.nil? && !workingUSNode._seen
			workingUSNode.selected=true
			#Now that hash is ready with node id's as key and upstream subcatchments as paired values, keys can be used to get an array containing upstream subcathments
            #In the below code id's of subcatchments upstream of node 'node_1' are printed. The below code can be reused multiple times for different nodes within the script without being computationally expensive
            node_sub_hash_map[workingUSNode.id].each  do |sub|
			puts "Found Upstream Subcatchment #{sub.id} connected to Node #{workingUSNode.id}"
	        sub.selected=true
            end
			workingUSNode.us_links.each do |l|
				if !l._seen
					unprocessedLinks << l
					l.selected=true
					l._seen=true
				end
			end
		end
	end
end
