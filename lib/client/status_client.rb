# == Class StatusClient
# The StatusClient class provides access to the Status API.
#
# The Status API provides access to the status of postings, both inside and
# outside of the 3taps system. The Status API is built upon the assumption that
# most postings can be globally identified using two pieces of data: the source
# and the externalID. Since we can globally identify a posting, we can share the
# status of postings between various systems.
#
# For example, if a posting has been
# "sent" to the Posting API by an external source, that external source can
# optionally send a status of "sent" to the Status API. Once the Posting API has
# processed and saved the posting, it can send the status of "saved" to the
# Status API. Later, if somebody looks up the posting in the Status API, they
# will see both of these events (sent and saved), along with the time that they
# occurred, and any relevant attributes (postKey, errors, etc). Having this
# information available allows 3taps and sources to provide maximum visibility
# into their processes so that both can improve data yield.
#
# Class StatusClient provides access to the status API of postings
# server response returns the status of postings, if a posting has been "sent" to the Posting API by an 
# external source, that external source can optionally send a status of "sent" the Status API.
#
# Its methods are used to query API with appropriate requests:
#
class StatusClient < Client
  #
  # Send in status events for postings.
  # update_status(postings) - returns message
  #
  #  Examples:
  #
    #  posting_client = PostingClient.new
    #  status_client = StatusClient.new
    #  update_request = StatusUpdateRequest.new
    #  posting = posting_client.get_posting("BD9FHQC")
    #  error = Message.new(:code => 602, :message => "UFO posting error")
    #  posting.status.errors << error
    #  posting.status.attributes = {:postKey => "TESTKEY", :message => "UFO test message"}
    #  posting.status.event = 'lost'
    #  update_response = status_client.update_status(posting)
    #
    #  status_response.code        # => "200"
    #  status_response.message     # => "Update"
  #
  def update_status(postings)
    postings = [postings] unless postings.is_a? Array
    params ='events=['
    params << postings.collect{|posting| "{#{posting.status.to_params}, #{posting.to_json_for_status_client}}" unless posting.status.event.empty?}.join(',')
    params << "]"
    response = execute_post("status/update", params)
    Message.new(decode(response))
  end
  #
  # Get status history for postings.
  # get_status(postings) - returns array of class GetStatusResponse
  #
  #  Examples: 
  #
    #  search_request = SearchRequest.new
    #  search_request.category = 'VAUT'
    #  search_request.annotations = {:Make => "porsche"}
    #  search_request.rpp = 2
    #  search_request.retvals = ["source", "externalID"]
    #
    #  client = SearchClient.new
    #  search_response = client.search(search_request)
    #  existing_postings = search_response.results
    #  existing_postings
    #  clientS = StatusClient.new
    #  response = clientS.get_status(existing_postings)
    #
    #  response[1]      # => [{"exists" => "false"}]
  #
  def get_status(postings)
    postings = [postings] unless postings.is_a? Array
    data = "["
    data << postings.collect{|posting| "{#{posting.to_json_for_status_client}}"}.join(',')
    data << "]"
    params = "ids=#{data}"
    response = execute_post("status/get", params)
    GetStatusResponse.from_array(decode(response))
  end
  #
  # Get the current system status.
  # system_status() - returns message
  #
  #  Examples:
  #
    #  client = StatusClient.new
    #  status_response = client.system_status
    #  status_response.code        # => "200"
    #  status_response.message     # => "3taps is up and running!"
  #
  def system_status
    response = execute_get("/status/system")
    Message.new(decode(response))
  end

end
