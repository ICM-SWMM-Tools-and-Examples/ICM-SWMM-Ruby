def run_parameter(run_id)
    #Input ICM run ID to get all the parameters in the run as Hash
    db=WSApplication.open    
    mo_sim=db.model_object_from_type_and_id('Run',run_id)
    run_para=Hash.new
    db.list_read_write_run_fields.each do |p|
        run_para[p]= mo_sim[p]    
    end
    return run_para
end

puts run_parameter(run_id)
