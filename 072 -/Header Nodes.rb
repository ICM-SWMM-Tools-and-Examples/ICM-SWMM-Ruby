# the code is from https://github.com/chaitanyalakeshri/ruby_scripts
# modifed by CHATGPT

#Check if there is a network open in the WSApplication 
if WSApplication.current_network.nil?
    puts "Error: There is no network open in the WSApplication."
    return
end

net=WSApplication.current_network
net.clear_selection

#Creating an array to store node ID
nodes_arry= Array.new

#validating if the nodes_oc is empty or not
if (nodes_oc=net.row_objects('_nodes')).empty?
    puts "Error: _nodes object collection is empty"
    return
end

#stores node id into array called 'nodes_arry' from nodes object collection
nodes_oc.each do |node|
    nodes_arry << node.node_id
end

#Creating an array to store d/s node ID
downstream_node_arry= Array.new

#validating if the links_oc is empty or not
if (links_oc=net.row_objects('_links')).empty?
    puts "Error: _links object collection is empty"
    return
end

#stores u/s node id into array called 'ds_node_arry' from link object collection
links_oc.each do |link|
    downstream_node_arry << link.ds_node_id
end

nodes_arry.each do |node_id|
    if !downstream_node_arry.include?(node_id)
        net.row_object('_nodes',node_id).selected=true
    end
end
