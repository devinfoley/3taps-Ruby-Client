class Posting < SuperModel::Base
  attributes :postKey, :heading, :body, :category, :source, :location,
             :longitude, :latitude, :language, :price, :currency, :images,
             :externalURL, :externalID, :accountName, :accountID, :clickCount,
             :timestamp, :expiration, :indexed, :trustedAnnotations,
             :annotations, :errors, :history

  def initialize(*params)
    super(*params)
    @attributes[:images] ||= []
    @attributes[:annotations] ||= {}
    @attributes[:history] ||= []
  end

  def to_json
    posting = "{"+'source:'+"'#{self.source}'" + ',category:' + "'#{self.category}'" + ',location:' + "'#{self.location}'" + ',heading:' +  "'#{CGI.escape self.heading}'"
    posting << ",timestamp: '#{(Time.now.utc.to_s(:db)).gsub(/\s/,"+")}'"
    posting << ',images:' + "[#{images.collect{ |image| "'#{image}'"}.join(',')}]"
    if self.body.present?
      posting << ',body:' + "'#{CGI.escape self.body}'"
    end
    if self.annotations
      annotations = []
      self.annotations.each{|k,v| annotations << "#{k}:" + "'#{v}'"}
      posting << ',annotations:' + "[{#{annotations.join(',')}}]"
    end
    posting  +  "}"
  end

  def to_json_for_update
    data = "['#{self.postKey}',"
    data << "{" + 'heading:' +  "'#{CGI.escape self.heading}'"
    #data << ',images:' + "[#{images.collect{ |image| "'#{image}'"}.join(',')}]"
    if self.body.present?
      data << ',body:' + "'#{CGI.escape self.body}'"
    end
    if self.annotations
      annotations = []
      self.annotations.each{|k,v| annotations << "#{k}:" + "'#{v}'"}
      data << ',annotations:' + "[{#{annotations.join(',')}}]"
    end
    data << "}"
    data << "]"
  end

  def to_json_for_status_get
    # {source: 'CRAIG', externalID: 3434399120}
    data = "{source:'"
    data <<  "#{CGI.escape self.source}"
    data << "', externalID:"
    data <<  "#{CGI.escape self.externalID}"
    data << "}"
    data
  end

  def to_json_for_status_update
#		{
#			"source":"E_BAY",
#			"externalID":"3434399120",
#			"status":"sent",
#			"timestamp":"2011/12/21 01:13:28",
#			"attributes":{
#				"postKey":"3JE8VFD"
#			}
#		}

    data = "{source:'#{CGI.escape self.source}', "
    data << "externalID:#{CGI.escape self.externalID}, "
    data <<  "status:'indexed', "
    data <<  "timestump:'#{((Time.now - 12.hours).utc.to_s(:db)).gsub(/\s/,"+")}', "
    data <<  "attributes:{#{get_sent_attributes}}, "
    data <<  "errors:[{code:666, message:'#{CGI.escape 'Some error mesage could be here!'}'}, {code:777, message:'#{CGI.escape 'JackPot!!!'}'}]"
    data << "}"
    data
  end

  def get_sent_attributes
    "postKey:'#{self.postKey}', message:'#{CGI.escape 'Test message attribute'}', custom:'#{CGI.escape 'Test custom attribute'}'"
  end
end