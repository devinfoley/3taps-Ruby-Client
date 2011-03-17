class Posting < SuperModel::Base
  attributes :postKey, :heading, :body, :category, :source, :location,
             :longitude, :latitude, :language, :price, :currency, :images,
             :externalURL, :externalID, :accountName, :accountID, :clickCount,
             :timestamp, :expiration, :indexed, :trustedAnnotations,
             :annotations, :errors, :status

  def initialize(*params)
    super(*params)
    @attributes[:images] ||= []
    @attributes[:annotations] ||= {}
    @attributes[:status] ||= UpdateStatusRequest.new(:event => '', :timestump => nil, :attributes => {}, :errors => [])
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

  def to_json_for_status_client
    # source: 'CRAIG', externalID: 3434399120
    data = "source:'#{CGI.escape self.source}', "
    data << "externalID:#{CGI.escape self.externalID}"
    data
  end

end