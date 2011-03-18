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
    params = "posts=#{data}"
    response = execute_post("/posting/create", params)
    CreateResponse.from_array(decode(response))
  end

  # Updates postings on 3taps.
  def update_posting(postings)
    postings = [postings] unless postings.is_a? Array
    data = "["
    data << postings.collect{|posting| posting.to_json_for_update}.join(',')
    data << "]"
    params = "data=#{data}"
    response = execute_post("posting/update", params)
    UpdateResponse.from_hash(decode(response))
  end

  # Deletes postings from 3taps.
  def delete_posting(post_keys)
    post_keys = [post_keys] unless post_keys.is_a? Array
    params = "data=['#{post_keys.join("','")}']"
    response = execute_post("posting/delete", params)
    DeleteResponse.new(decode(response))
  end

  # Returns information on the existence of postings.
  def exists_posting(posting)
    params = "ids=#{posting}"
    response = execute_post("/posting/exists", params)
    ExistsResponse.from_array(decode(response))
  end
end
