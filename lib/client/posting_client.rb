# PostingClient class handles all posting routines: getting a posting, creating,
# deleting, updating and checking if one exists.
class PostingClient < Client

  def get_posting(post_key)
    response = execute_get("/posting/get/" + post_key)
    ActiveSupport::JSON.decode(response)
  end

  # Method create_posting receives one parameter of type Posting, creates
  # params hash for it and sends via POST.
  # Returns CreateResponse object
  def create_posting(posting)
    params = "posts=#{posting}"
    response = execute_post("/posting/create", params)
    ActiveSupport::JSON.decode(response)
  end

  def update_posting(posting)
    params = "data=#{posting}"
    response = execute_post("/posting/update", params)
    ActiveSupport::JSON.decode(response)
  end

  def delete_posting(post_key)
    params = "data=#{CGI.escape(ActiveSupport::JSON.encode([post_key]))}"
    response = execute_post("/posting/delete", params)
    ActiveSupport::JSON.decode(response)
  end

  def exists(posting)
    params = "ids=#{posting}"
    response = execute_post("/posting/exists", params)
    ActiveSupport::JSON.decode(response)
  end
  
end

