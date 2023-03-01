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
        total_invert = 0.0
        total_ground = 0.0
        total_depth = 0.0
        
        nodes_ro.each do |node|
            number_nodes += 1
            if node.node_type == 'Outfall'
                number_outfalls += 1
            elsif node.node_type == 'Storage'
                number_storage += 1
            elsif node.node_type == 'Junction'
                number_junction += 1
            end
            total_invert += node.invert_elevation
            total_ground += node.ground_level
            total_depth += node.maximum_depth
        end
        
        average_invert = total_invert / number_nodes
        average_ground = total_ground / number_nodes
        average_depth = total_depth / number_nodes
        
        printf "%-30s %-d\n", "Number of SW Nodes", number_nodes
        printf "%-30s %-d\n", "Number of SW Junctions", number_junction
        printf "%-30s %-d\n", "Number of SW Storage", number_storage
        printf "%-30s %-d\n", "Number of SW Outfalls", number_outfalls
        printf "%-30s %-f\n", "Average Invert Elevation", average_invert
        printf "%-30s %-f\n", "Average Ground Elevation", average_ground
        printf "%-30s %-f\n", "Average Full Depth", average_depth
        

        links_hash_map = {}
        links_hash_map = Hash.new { |h, k| h[k] = [] }
        links_ro = net.row_objects('sw_conduit')
        raise "Error: links not found" if links_ro.nil?
        number_links = 0
        number_length = 0.0
        total_conduit_height = 0.0
        total_conduit_width = 0.0
        total_manning_n = 0.0
        total_downstream_invert = 0.0
        total_upstream_invert = 0.0
        
        links_ro.each do |link|
            number_links += 1
            number_length += link.length
            total_conduit_height += link.Conduit_height
            total_conduit_width += link.Conduit_width
            total_manning_n += link.Mannings_N
            total_downstream_invert += link.ds_invert
            total_upstream_invert += link.us_invert
        end
        
        average_conduit_height = total_conduit_height / number_links
        average_conduit_width = total_conduit_width / number_links
        average_manning_n = total_manning_n / number_links
        average_downstream_invert = total_downstream_invert / number_links
        average_upstream_invert = total_upstream_invert / number_links
        
        printf "%-30s %-d\n", "Number of SW Links", number_links
        printf "%-30s %-f\n", "Total SW Length", number_length
        printf "%-30s %-f\n", "Average Conduit Height", average_conduit_height
        printf "%-30s %-f\n", "Average Conduit Width", average_conduit_width
        printf "%-30s %-f\n", "Average Manning n", average_manning_n
        printf "%-30s %-f\n", "Average Downstream Invert", average_downstream_invert
        printf "%-30s %-f\n", "Average Upstream Invert", average_upstream_invert
        

        subcatchments_hash_map = {}
        subcatchments_hash_map = Hash.new { |h, k| h[k] = [] }
        subcatchments_ro = net.row_objects('sw_subcatchment')
        raise "Error: subcatchments not found" if subcatchments_ro.nil?
        number_subcatchments = 0
        total_area = 0.0
        total_imperviousness = 0.0
        total_slope = 0.0
        total_width = 0.0
        
        subcatchments_ro.each do |subcatchment|
            number_subcatchments += 1
            total_area += subcatchment.area
            total_imperviousness += subcatchment.percent_impervious
            total_slope += subcatchment.catchment_slope
            total_width += subcatchment.width
        end
        
        average_imperviousness = total_imperviousness / number_subcatchments
        average_slope = total_slope / number_subcatchments
        average_width = total_width / number_subcatchments
        
        printf "%-30s %-d\n", "Number of SW Subcatchments", number_subcatchments
        printf "%-30s %-f\n", "Total SW Subcatchment Area", total_area
        printf "%-30s %-f\n", "Average Imperviousness", average_imperviousness
        printf "%-30s %-f\n", "Average Subcatchment Slope", average_slope
        printf "%-30s %-f\n", "Average Subcatchment Width", average_width
        
        pumps_hash_map = {}
        pumps_hash_map = Hash.new { |h, k| h[k] = [] }
        pumps_ro = net.row_objects('sw_pump')
        raise "Error: pump not found" if pumps_ro.nil?
        number_pumps = 0
        pumps_ro.each do |pump|
            number_pumps += 1
        end
        printf "%-30s %-d\n", "Number of Pumps", number_pumps
    
    weirs_hash_map = {}
    weirs_hash_map = Hash.new { |h, k| h[k] = [] }
    weirs_ro = net.row_objects('sw_weir')
    raise "Error: weirs not found" if weirs_ro.nil?
    number_weirs = 0
    weirs_ro.each do |weir|
        number_weirs += 1
    end
    printf "%-30s %-d\n", "Number of Weirs", number_weirs
    
    orifices_hash_map = {}
    orifices_hash_map = Hash.new { |h, k| h[k] = [] }
    orifices_ro = net.row_objects('sw_orifice')
    raise "Error: orifices not found" if orifices_ro.nil?
    number_orifices = 0
    orifices_ro.each do |orifice|
        number_orifices += 1
    end
    printf "%-30s %-d\n", "Number of Orifices", number_orifices
    
    channels_hash_map = {}
    channels_hash_map = Hash.new { |h, k| h[k] = [] }
    channels_ro = net.row_objects('sw_outlet')
    raise "Error: outletds not found" if channels_ro.nil?
    number_channels = 0
    channels_ro.each do |channel|
        number_channels += 1
    end
    printf "%-30s %-d\n", "Number of Outlets", number_channels

    printf "%-30s\n", "This was an overview of the elements in an ICM SWMM Network"

    rescue => e
        puts "Error: #{e.message}"
      end
      
    
    