# Class SummaryResponse represents server response on +summary+ Search API
# request. Server response is sent to initializer which creates object with
# attributes +totals+, +execTimeMs+ accessible via getters:
# * +totals+
# * +execTimeMs+
# * +exec_time_ms+
#
# Examples:
#
#  response = SummaryResponse.new("totals" => 20, "execTimeMs" => 100)
#  response.totals       # => 20
#  response.execTimeMs   # => 100
#  response.exec_time_ms # => 100
#
class SummaryResponse < Struct.new(:totals, :execTimeMs) do
    def exec_time_ms
      execTimeMs
    end
  end
end
