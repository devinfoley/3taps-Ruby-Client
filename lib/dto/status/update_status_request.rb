class UpdateStatusRequest
  
  def to_params
#		{
#			"status":"sent",
#			"timestamp":"2011/12/21 01:13:28",
#			"attributes":{
#				"postKey":"3JE8VFD"
#			}
#		}

    data =  "status:'found', "
    data <<  "timestump:'#{((Time.now - 12.hours).utc.to_s(:db)).gsub(/\s/,"+")}', "
    data <<  "attributes:{#{get_sent_attributes}}, "
    data <<  "errors:[{code:666, message:'#{CGI.escape 'Some error mesage could be here!'}'}, {code:777, message:'#{CGI.escape 'JackPot!!!'}'}], "
    data
  end

  def get_sent_attributes
    "postKey:'BBBBB', message:'#{CGI.escape 'Test message attribute'}', custom:'#{CGI.escape 'Test custom attribute'}'"
  end
end