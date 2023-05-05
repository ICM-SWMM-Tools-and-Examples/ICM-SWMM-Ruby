require 'win32ole'

# Convert a .DBF file to .CSV using WIN32OLE / Excel
#
# @param dbf_path [String] absolute path to a folder containing .DBF files
# @param csv_path [String] absolute path to the output folder where we'll save .CSV files
def convert_dbf_to_csv (dbf_path, csv_path)
  raise "Invalid DBF file: #{dbf_path}" unless File.exist?(dbf_path)
  raise "Invalid CSV path: #{csv_path}" unless File.exist?(csv_path)

  # Convert directory seperators from Windows-style (backwards) to Ruby/Unix style (forward)
  dbf_path.gsub!('\\', '/')
  csv_path.gsub!('\\', '/')

  # Create Excel application instance
  excel = WIN32OLE::new('Excel.Application')

  # Do this in a begin/ensure block to make sure we close Excel nicely if we break something
  begin
    files = Dir.glob(dbf_path + "/*.{DBF}")

    files.each do |dbf|
      puts "Exporting #{dbf}"

      filename = File.basename(dbf, '.*')

      # Create absolute base path to our CSV file (no extension)
      # WIN32OLE insists on using Windows-style backward slashes for the directory seperator
      output = File.join(csv_path, filename).gsub('/', '\\')

      # If the CSV already exists, delete it to avoid permission shenanigans
      File.delete(output + '.csv') if File.exist?(output + '.csv')

      # https://learn.microsoft.com/en-us/office/vba/api/excel.worksheet.saveas
      # https://learn.microsoft.com/en-us/office/vba/api/excel.xlfileformat
      # Open the DBF file and save it as a UTF-8 CSV
      workbook = excel.Workbooks.Open(dbf)
      workbook.Worksheets[filename].SaveAs(output, 62)

      # Close this workbook
      workbook.Close
    end
  rescue => err
    warn "Did not export #{dbf_name}.DBF"
    warn err
  ensure
    excel.Quit()
  end
end

model_folder = WSApplication.folder_dialog('Select Source Folder Containing .DBF files', true)
destination_folder = WSApplication.folder_dialog('Select Destination Folder for .CSV files', true)

convert_dbf_to_csv(model_folder, destination_folder)
