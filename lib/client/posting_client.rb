# The PostingClient class allows clients to use 3taps Posting API to store and
# retrieve postings in the 3taps system.
#
# Its methods are used to query API with appropriate requests:
#  client = PostingClient.new
#  client.get_posting(post_key)      # => returns a single Posting object
#  client.create_posting(postings)   # => returns array of CreateResponse objects
#  client.update_posting(postings)   # => returns array of UpdateResponse objects
#  client.delete_posting(post_keys)  # => returns array of DeleteResponse objects
#  client.exists_posting(posting)    # => returns array of ExistsResponse objects
class PostingClient < Client

  # Retrieves an information about a single posting.
  # 
  # Example
  #  client = PostingClient.new
  #  client.get_posting("...postKey string...") => Posting object
  #
  def get_posting(post_key)
    response = execute_get("/posting/get/" + post_key)
    Posting.new(decode(response))
  end

  # Method +create_posting+ saves a single new posting and multiple new postings in 3taps.
  #
  # Examples
  #  client = PostingClient.new
  #  client.update_posting([posting1, posting2])  #=> Array of CreateResponse objects
  #
  #  client = PostingClient.new
  #  client.update_posting(posting2)  #=> Array with single CreateResponse object
  #
  def create_posting(postings)
    postings = [postings] unless postings.is_a? Array
    data = "["
    data << postings.collect{|posting| posting.to_json}.join(',')
    data << "]"
    params = "posts=#{data}"
    response = execute_post("/posting/create", params)
    CreateResponse.from_array(decode(response))
  end

  # Method +update_posting+ updates  a single posting and multiple postings on 3taps.
  #
  # Examples:
  #  client = PostingClient.new
  #  client.update_posting([posting1, posting2])  #=> Array of UpdateResponse objects
  #
  #  client = PostingClient.new
  #  client.update_posting(posting)  #=> Array with single UpdateResponse object
  #
  def update_posting(postings)
    postings = [postings] unless postings.is_a? Array
    data = "["
    data << postings.collect{|posting| posting.to_json_for_update}.join(',')
    data << "]"
    params = "data=#{data}"
    response = execute_post("posting/update", params)
    UpdateResponse.from_hash(decode(response))
  end

  # Method +delete_posting+  deletes a single posting and multiple postings from 3taps.
  # 
  # Examples:
  #  client = PostingClient.new
  #  response = client.delete_posting(...Array of postKeys strings...)     # => Array of DeleteResponse objects
  #
  #  client = PostingClient.new
  #  key = some_posting.postKey
  #  response = client.delete_posting(key)     # => Array with single DeleteResponse object
  #
  def delete_posting(post_keys)
    post_keys = [post_keys] unless post_keys.is_a? Array
    params = "data=['#{post_keys.join("','")}']"
    response = execute_post("posting/delete", params)
    DeleteResponse.from_hash(decode(response))
  end

  # NOT USED
  #
  #  Returns information on the existence of postings.
  #
  def exists_posting(posting)
    params = "ids=[#{posting.to_json_for_status}]"
    response = execute_post("/posting/exists", params)
    p decode(response)[0]
    ExistsResponse.new(decode(response)[0])
  end
end
