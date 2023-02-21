# The code is from https://github.com/chaitanyalakeshri/ruby_scripts 
#Input ICM run ID to get all the parameters in the run as Hash

def run_parameter(run_id)
    # Input ICM run ID to get all the parameters in the run as Hash
    require 'date'
    db = WSApplication.open
    mo_sim = db.model_object_from_type_and_id('Run', run_id)
    run_para = Hash.new
    db.list_read_write_run_fields.each do |p|
      run_para[p] = mo_sim[p]
    end
    return run_para
  end
  
  run_id = "your_run_id"
  puts run_parameter(run_id)
  