# Source https://github.com/chaitanyalakeshri/ruby_scripts 
begin
    # Accessing current network
    net = WSApplication.current_network
    raise "Error: current network not found" if net.nil?
  
    # Accesing Row objects or collection of row objects 
    # There are four types of row objects: '_nodes', '_links', '_subcatchments', '_others'.
  
    # Get all the nodes or links or subcatchments as row object collection for InfoWorks Network

    nodes_roc = net.row_object_collection('hw_node')
    raise "Error: nodes not found" if nodes_roc.nil?
  
    links_roc = net.row_object_collection('hw_conduit')
    raise "Error: links not found" if links_roc.nil?
  
    subcatchments_roc = net.row_object_collection('hw_subcatchment')
    raise "Error: subcatchments not found" if subcatchments_roc.nil?
  
    # one can also access exclusive tables like pump table ,conduit table or orifice table
    pump_roc = net.row_object_collection('hw_pump')
    raise "Error: pump not found" if pump_roc.nil?
  
    # Get all the nodes or links or subcatchments as array in an InfoWorks Network
    nodes_hash_map={}
    nodes_hash_map = Hash.new { |h, k| h[k] = [] }
    nodes_ro = net.row_objects('_nodes')
    raise "Error: nodes not found" if nodes_ro.nil?
    number_nodes = 0
    nodes_ro.each do |node|
        number_nodes += 1
    end       
    printf "%-30s %-d\n", "Number of HW Nodes...", number_nodes

    links_hash_map = {}
    links_hash_map = Hash.new { |h, k| h[k] = [] }
    links_ro = net.row_objects('_links')
    raise "Error: links not found" if links_ro.nil?
    number_links = 0
    links_ro.each do |link|
        number_links += 1
    end          
    printf "%-30s %-d\n", "Number of HW Links...", number_links

    subcatchments_hash_map = {}
    subcatchments_hash_map = Hash.new { |h, k| h[k] = [] }
    subcatchments_ro = net.row_objects('_subcatchments')
    raise "Error: subcatchments not found" if subcatchments_ro.nil?
    number_subcatchments = 0
    subcatchments_ro.each do |subcatchment|
        number_subcatchments += 1
    end
    printf "%-30s %-d\n", "Number of HW Subcatchments.", number_subcatchments
   
rescue => e
    puts "Error: #{e.message}"
  end
  

