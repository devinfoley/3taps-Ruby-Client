class SearchRequest
  attr_accessor :rpp, :page, :source, :category, :location, :heading,
    :body, :text, :external_id, :start, :end, :annotations, :trusted_annotations, :retvals

  def initialize
    @retvals = []
  end

  def add_retval(retval)
    @retvals << retval
  end

  def query_params
    query = ""#Hash.new
    query += "rpp=#{rpp}&" unless rpp.nil?
    query += "source=#{source}&" unless source.nil?
    query += "location=#{location}&" unless location.nil?
    query == "" ? nil : query
  end
end

=begin
    if (page != nil)
      query[:page] = page.to_s;
    end
    if (source != nil)
      query[:source] = source.to_s;
    end
    if (page != nil)
      query[:page] = page.to_s;
    end
    if (category != nil)
      query[:category] = category.to_s;
    end
    if (location != nil)
      query[:location] = location.to_s;
    end
    if (heading != nil)
      query[:heading] = heading.to_s;
    end
    if (body != nil)
      query[:body] = body.to_s;
    end
    if (text != nil)
      query[:text] = text.to_s;
    end
    if (external_id != nil)
      query[:external_id] = external_id.to_s;
    end
    if (start != nil)
      query[:start] = start.to_s;
    end
    if (self.end != nil)
      query[:end] = self.end.to_s;
    end

    #final Type annotationType = new TypeToken<Map<String, String>>() {}.getType();
    #final Gson gson = new GsonBuilder()
    #.registerTypeAdapter(Map.class, new GeneralObjectDeserializer())
    #.create();

    if (annotations != nil && annotations.size > 0)
      query[:annotations] = ActiveSupport::JSON.encode(annotations)
    end
    if (trusted_annotations != nil && trusted_annotations.size > 0)
      query[:trusted_annotations] = ActiveSupport::JSON.encode(trusted_annotations)
    end
    if (retvals != nil)
       #query[:retvals] = retvals.to_str  #queryParams.put("retvals", Utils.join(retvals));
    end

    "?" + query.each(""){|option| "#{option[0]}=#{option[1]}" }
    
  end
=end

#	public Map<String, String> getQueryParams() {
#		final Map<String, String> queryParams = new HashMap<String, String>();
#
#		if (rpp != null)
#			queryParams.put("rpp", rpp.toString());
#		if (page != null)
#			queryParams.put("page", page.toString());
#		if (source != null)
#			queryParams.put("source", source);
#		if (category != null)
#			queryParams.put("category", category);
#		if (location != null)
#			queryParams.put("location", location);
#		if (heading != null)
#			queryParams.put("heading", heading);
#		if (body != null)
#			queryParams.put("body", body);
#		if (text != null)
#			queryParams.put("text", text);
#		if (externalID != null)
#			queryParams.put("externalID", externalID);
#
#		DateFormat df = new SimpleDateFormat(Constants.DATE_FORMAT);
#
#		if (start != null)
#			queryParams.put("start", df.format(start));
#		if (end != null)
#			queryParams.put("end", df.format(end));
#
#		final Type annotationType = new TypeToken<Map<String, String>>() {}.getType();
#		final Gson gson = new GsonBuilder()
#			.registerTypeAdapter(Map.class, new GeneralObjectDeserializer())
#			.create();
#
#		if (annotations != null && annotations.size() > 0)
#			queryParams.put("annotations", gson.toJson(annotations, annotationType));
#
#		if (trustedAnnotations != null && trustedAnnotations.size() > 0)
#			queryParams.put("trustedAnnotations", gson.toJson(trustedAnnotations, annotationType));
#
#		queryParams.put("retvals", Utils.join(retvals));
#
#		return queryParams;
#	}