# Source https://github.com/chaitanyalakeshri/ruby_scripts 

#Accessing current network
net=WSApplication.current_network

#Accesing Row objects or collection of row objects 
#There are four types of row objects: '_nodes', '_links', '_subcatchments', '_others'.

#Get all the nodes or links or subcatchments as row object collection
nodes_roc=net.row_object_collection('_nodes')
links_roc=net.row_object_collection('_links')
subcatchments_roc=net.row_object_collection('_subcatchments')
#one can also access exclusive tables like pump table ,conduit table or orifice table
pump_roc=net.row_object_collection('hw_pump')

#Get all the nodes or links or subcatchments as array
nodes_ro=net.row_objects('_nodes')
links_ro=net.row_objects('_links')
subcatchments_ro=net.row_objects('_subcatchments')

#one can also access exclusive tables like pump table ,conduit table or orifice table
pump_ro=net.row_objects('hw_pump')

#accessing an individual row object
ro=net.row_object('hw_conduit','1234567.1')

#Getting value of particular field from a specific row object
ro=net.row_object('hw_conduit','1234567.1').field_name

#selecting a particular object
ro=net.row_object('hw_conduit','1234567.1').selected=true

#clear selection
net.clear_selection