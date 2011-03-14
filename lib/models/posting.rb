class Posting < SuperModel::Base
  attributes :postKey, :heading, :body, :category, :source, :location,
             :longitude, :latitude, :language,
             :price, :currency,
             :externalURL, :externalID, :accountName, :accountID,
             :timestamp, :expires, :indexed, :exists, :status,
             :annotations, :errors, :history
        def annotations=(annotations)
    @attributes[:annotations] = annotations || {}
  end

         def history=(history)
    @attributes[:history] = history || []
  end

  def to_params
   posting = "[{"+'source:'+"'#{self.source}'" + ',category:' + "'#{self.category}'" + ',location:' + "'#{self.location}'" + ',heading:' +  "'#{CGI.escape self.heading}'"  + ',timestamp:' + "'#{(Time.now.utc.to_s(:db)).gsub(/\s/,"+")}'"
    if @files
      posting << ',images:' + "[#{@urls.collect{ |url| "'#{url}'"}.join(',')}]"
    end
    if self.body.present?
      posting << ',body:' + "'#{CGI.escape self.body}'"
    end
#    unless @anonymize
#      posting << ',accountName:' + "'#{self.email}'"
#    end
    if self.annotations
      annotations = []
      self.annotations.each{|k,v| annotations << "#{k}:" + "'#{v}'"}
      posting << ',annotations:' + "[{#{annotations.join(',')}}]"
    end
    posting  +  "}]"
  end
end