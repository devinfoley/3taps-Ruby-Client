# Class StatusUpdateRequest returns the correct string for request 3taps
# 
class StatusUpdateRequest < Struct.new(:event, :timestump, :attributes, :errors)  
  #
  # Method +to_params+ creates the correct string for request 3taps.
  #
  def to_params
    data =  "status:'#{event}'"
    data <<  ", timestump:'#{((timestump).utc.to_s(:db)).gsub(/\s/,"+")}'" if timestump
    data <<  ", attributes:{#{attributes_for_params}}" unless attributes.empty?
    data <<  ", errors:[#{errors_for_params}]" unless errors.empty?
    data
  end
  #
  # Method +attributes_for_params+ creates array attributes for params.
  #
  def attributes_for_params
    attributes.collect{ |key, value| "#{key}:'#{CGI.escape value}'"  }.join(", ")
  end
  #
  # Method +errors_for_params+ array errors for params.
  #
  def errors_for_params
    errors.collect{ |error| "{code:#{error.code}, message:'#{CGI.escape error.message}'}" }.join(", ")
  end

end
