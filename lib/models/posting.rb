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

  def to_json(with_timestamp = true)
    posting = "{"+'source:'+"'#{self.source}'" + ',category:' + "'#{self.category}'" + ',location:' + "'#{self.location}'" + ',heading:' +  "'#{CGI.escape self.heading}'"
    posting << ",timestamp: '#{(Time.now.utc.to_s(:db)).gsub(/\s/,"+")}'" if with_timestamp
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
    data << self.to_json(false)
    data << "]"
  end

  def to_json_for_status
    # {source: 'CRAIG', externalID: 3434399120}
    data = "{source: '"
    data <<  self.source
    data << "', externalID: "
    data << self.externalID
    data << "}"
    data
  end
end