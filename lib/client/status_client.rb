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
class StatusClient < Client

  # Send in status events for postings.
  def update_status(get_request)
    params = "data=#{get_request}"
    response = execute_get("status/update", params)
    Message.new(decode(response))
  end

  # Get status history for postings.
 def get_status(postings)
    postings = [postings] unless postings.is_a? Array
    data = "["
    data << postings.collect{|posting| posting.to_json_for_status}.join(',')
    data << "]"
    #p data
    params = "ids = #{data}"
    #p ActiveSupport::JSON.encode(params)
    response = execute_post("status/get", ActiveSupport::JSON.encode(params))
    GetResponse.from_json(decode(response))
  end

  # Get the current system status.
  def system_status
    response = execute_get("status/system")
    Message.new(decode(response))
  end

end
