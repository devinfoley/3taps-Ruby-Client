# The PostingClient allows developers to use 3taps Posting API to store and
# retrieve postings in the 3taps system.
class PostingClient < Client

  # Returns information about a single posting.
  def get_posting(post_key)
    response = execute_get("/posting/get/" + post_key)
    Posting.new(ActiveSupport::JSON.decode(response))
  end

  # Saves a new posting in 3taps.
  def create_posting(posting)
    params = "posts=#{posting}"
    response = execute_post("/posting/create", params)
    CreateResponse.from_json(ActiveSupport::JSON.decode(response))
  end

  # Updates postings on 3taps.
  def update_posting(posting)
    params = "data=#{posting}"
    response = execute_post("/posting/update", params)
    UpdateResponse.from_json(ActiveSupport::JSON.decode(response))
  end

  # Deletes postings from 3taps.
  def delete_posting(post_key)
    params = "data=#{CGI.escape(ActiveSupport::JSON.encode([post_key]))}"
    response = execute_post("/posting/delete", params)
    DeleteResponse.from_json(ActiveSupport::JSON.decode(response))
  end

  def exists(posting)
    params = "ids=#{posting}"
    response = execute_post("/posting/exists", params)
    ActiveSupport::JSON.decode(response)
  end
  
end

