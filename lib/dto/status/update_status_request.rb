class UpdateStatusRequest < Struct.new(:event, :timestump, :attributes, :errors)  

  include HashedInitializer

  def to_params
    data =  "status:'#{event}'"
    data <<  ", timestump:'#{((timestump).utc.to_s(:db)).gsub(/\s/,"+")}'" if timestump
    data <<  ", attributes:{#{attributes_for_params}}" unless attributes.empty?
    data <<  ", errors:[#{errors_for_params}]" unless errors.empty?
    data
  end

  def attributes_for_params
    attributes.collect{ |key, value| "#{key}:'#{CGI.escape value}'"  }.join(", ")
  end

  def errors_for_params
    errors.collect{ |error| "{code:#{error.code}, message:'#{CGI.escape error.message}'}" }.join(", ")
  end

end