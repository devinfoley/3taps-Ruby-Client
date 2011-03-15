# The PostingClient allows developers to use 3taps Posting API to store and
# retrieve postings in the 3taps system.

# The PostingClient allows developers to use 3taps Posting API to store and
# retrieve postings in the 3taps system.
class PostingClient < Client

  # Returns information about a single posting.
  def get_posting(post_key)
    response = execute_get("/posting/get/" + post_key)
    Posting.new(decode(response))
  end

  # Saves a new posting in 3taps.
  def create_posting(postings)
    postings = [postings] unless postings.is_a? Array

    data = "["
    data << postings.collect{|posting| posting.to_json}.join(',')
    data << "]"

    # GET
    params = "posts=#{data}"
    response = execute_get("/posting/create", params)
    # POST
    #    params = {:posts => data} #"posts=#{data}"
    #    response = execute_post("posting/create", ActiveSupport::JSON.encode(params))
    CreateResponse.from_array(decode(response))
  end

  # Updates postings on 3taps.
  def update_posting(postings)
    postings = [postings] unless postings.is_a? Array

    data = "["
    data << postings.collect{|posting| posting.to_json_for_update}.join(',')
    data << "]"

    params = "data=#{CGI.escape(data)}"
    response = execute_post("/posting/update", params)
    UpdateResponse.from_json(decode(response))
  end

  # Deletes postings from 3taps.
  def delete_posting(post_keys)
    post_keys = [post_keys] unless post_keys.is_a? Array
    params = "data=#{CGI.escape(ActiveSupport::JSON.encode(post_keys))}"
    response = execute_post("/posting/delete", params)
    DeleteResponse.new(decode(response))
  end

  # Returns information on the existence of postings.
  def exists_posting(posting)
    params = "ids=#{posting}"
    response = execute_post("/posting/exists", params)
    decode(response)
  end
end

=begin
class PostingClient < Client

  # Returns information about a single posting.
  def get_posting(post_key)
    response = execute_get("/posting/get/" + post_key)
    Posting.new(decode(response))
  end

  # Saves a new posting in 3taps.
  def create_posting(posting)
    params = "posts=#{posting}"
    response = execute_post("/posting/create", params)
    CreateResponse.from_json(decode(response))
  end

  # Updates postings on 3taps.
  def update_posting(posting)
    params = "data=#{posting}"
    response = execute_post("/posting/update", params)
    UpdateResponse.from_json(decode(response))
  end

  # Deletes postings from 3taps.
  def delete_posting(post_key)
    params = "data=#{CGI.escape(ActiveSupport::JSON.encode([post_key]))}"
    response = execute_post("/posting/delete", params)
    DeleteResponse.from_json(decode(response))
  end

  def exists(posting)
    params = "ids=#{posting}"
    response = execute_post("/posting/exists", params)
    decode(response)
  end
  
end

=end