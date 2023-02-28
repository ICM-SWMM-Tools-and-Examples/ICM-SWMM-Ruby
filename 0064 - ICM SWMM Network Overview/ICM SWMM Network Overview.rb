# Source https://github.com/chaitanyalakeshri/ruby_scripts 
begin
    # Accessing current network
    net = WSApplication.current_network
    raise "Error: current network not found" if net.nil?

    # Get all the nodes or links or subcatchments as row object collection

    nodes_roc = net.row_object_collection('_nodes')
    raise "Error: nodes not found" if nodes_roc.nil?
  
    links_roc = net.row_object_collection('_links')
    raise "Error: links not found" if links_roc.nil?
  
    subcatchments_roc = net.row_object_collection('_subcatchments')
    raise "Error: subcatchments not found" if subcatchments_roc.nil?

        # Get all the nodes or links or subcatchments as array in an ICM SwMM Network
        nodes_hash_map={}
        nodes_hash_map = Hash.new { |h, k| h[k] = [] }
        nodes_ro = net.row_objects('sw_node')
        raise "Error: nodes not found" if nodes_ro.nil?
        number_nodes = 0
        number_outfalls = 0
        number_storage = 0
        number_junction = 0
        
        nodes_ro.each do |node|
            number_nodes += 1
            if node.node_type == 'Outfall'
                number_outfalls += 1
            elsif node.node_type == 'Storage'
                number_storage += 1
            elsif node.node_type == 'Junction'
                number_junction += 1
            end
        end
        
        printf "%-30s %-d\n", "Number of SW Nodes.....", number_nodes
        printf "%-30s %-d\n", "Number of SW Junctions.", number_junction
        printf "%-30s %-d\n", "Number of SW Storage...", number_storage
        printf "%-30s %-d\n", "Number of SW Outfalls..", number_outfalls

        links_hash_map = {}
        links_hash_map = Hash.new { |h, k| h[k] = [] }
        links_ro = net.row_objects('sw_conduit')
        raise "Error: links not found" if links_ro.nil?
        number_links = 0
        links_ro.each do |link|
            number_links += 1
        end          
        printf "%-30s %-d\n", "Number of SW Links...", number_links
    
        subcatchments_hash_map = {}
        subcatchments_hash_map = Hash.new { |h, k| h[k] = [] }
        subcatchments_ro = net.row_objects('sw_subcatchment')
        raise "Error: subcatchments not found" if subcatchments_ro.nil?
        number_subcatchments = 0
        subcatchments_ro.each do |subcatchment|
            number_subcatchments += 1
        end
        printf "%-30s %-d\n", "Number of SW Subcatchments.", number_subcatchments

        pumps_hash_map = {}
        pumps_hash_map = Hash.new { |h, k| h[k] = [] }
        pumps_ro = net.row_objects('sw_pump')
        raise "Error: pump not found" if pumps_ro.nil?
        number_pumps = 0
        pumps_ro.each do |pump|
            number_pumps += 1
        end
        printf "%-30s %-d\n", "Number of Pumps...", number_pumps
    
    weirs_hash_map = {}
    weirs_hash_map = Hash.new { |h, k| h[k] = [] }
    weirs_ro = net.row_objects('sw_weir')
    raise "Error: weirs not found" if weirs_ro.nil?
    number_weirs = 0
    weirs_ro.each do |weir|
        number_weirs += 1
    end
    printf "%-30s %-d\n", "Number of Weirs...", number_weirs
    
    orifices_hash_map = {}
    orifices_hash_map = Hash.new { |h, k| h[k] = [] }
    orifices_ro = net.row_objects('sw_orifice')
    raise "Error: orifices not found" if orifices_ro.nil?
    number_orifices = 0
    orifices_ro.each do |orifice|
        number_orifices += 1
    end
    printf "%-30s %-d\n", "Number of Orifices...", number_orifices
    
    channels_hash_map = {}
    channels_hash_map = Hash.new { |h, k| h[k] = [] }
    channels_ro = net.row_objects('sw_outlet')
    raise "Error: outletds not found" if channels_ro.nil?
    number_channels = 0
    channels_ro.each do |channel|
        number_channels += 1
    end
    printf "%-30s %-d\n", "Number of Outlets...", number_channels

    rescue => e
        puts "Error: #{e.message}"
      end
      
    
    