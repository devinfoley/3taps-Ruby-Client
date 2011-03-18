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
#  client = StatusClient .new
#  client.update_status(postings)    # => returns message of Message object
#  client.get_status(postings)       # => returns array of GetStatusResponse objects
#  client.system_status              # => returns message of Message object
#
class StatusClient < Client
  #
  # Method +update_status+ send in status events for postings. Example:
  #
    #  client = StatusClient.new
    #  request = StatusUpdateRequest.new
    #  client.update_status(request)   # => Message
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
  # Method +get_status+ get status history for postings. Example:
  #
    #  client = SearchClient.new
    #  postings = Posting.new
    #  response = client.get_status(postings)    # => GetStatusResponse
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
  # Method +system_status+ get the current system status. Example:
  #
    #  client = StatusClient.new
    #  response = client.system_status    # => Message
  #
  def system_status
    response = execute_get("/status/system")
    Message.new(decode(response))
  end

end
