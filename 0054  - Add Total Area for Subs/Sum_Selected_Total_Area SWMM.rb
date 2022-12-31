# Define a method to calculate the total area of the subcatchments
def calculate_total_area
  net = WSApplication.current_network
  total_area = 0

  net.transaction_begin
  net.row_object_collection('hw_subcatchment').each do |s|
    total_area += s.total_area if s.selected?
  end

  puts "Total Area: #{total_area}"
end

# Call the method to calculate and print the total area
calculate_total_area
puts 'Thank you for using Ruby in ICM InfoWorks'
