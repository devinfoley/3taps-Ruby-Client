# PostingClient class handles all posting routines: getting a posting, creating,
# deleting, updating and checking if one exists.
class PostingClient < Client

  # Method get_posting receives one parameter of type postKey, creates
  # params hash for it and sends via POST.
  # Returns Posting object
  def get_posting(post_key)
    response = execute_get("/posting/get/" + post_key)
    Posting.new(ActiveSupport::JSON.decode(response))
  end

  # Method create_posting receives one parameter of type Posting, creates
  # params hash for it and sends via POST.
  # Returns CreateResponse object
  def create_posting(posting)
    params = "posts=#{posting}"
    response = execute_post("/posting/create", params)
    CreateResponse.from_json(ActiveSupport::JSON.decode(response))
  end

  # Method update_posting receives one parameter of type Posting, creates
  # params hash for it and sends via POST.
  # Returns UpdateResponse objec
  def update_posting(posting)
    params = "data=#{posting}"
    response = execute_post("/posting/update", params)
    UpdateResponse.from_json(ActiveSupport::JSON.decode(response))
  end

  # Method delete__posting receives one parameter of type array postKey, creates
  # params hash for it and sends via POST.
  # Returns DeleteResponse object
  def delete_posting(post_key)
    params = '#{post_key}'
    response = execute_get("/posting/delete", params)
    DeleteResponse.from_json(ActiveSupport::JSON.decode(response))
  end

  def exists(posting)
    params = "ids=#{posting}"
    response =  execute_post("/posting/exists", params)
    ActiveSupport::JSON.decode(response)
  end
  
end

