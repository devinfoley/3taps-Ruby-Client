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
end
