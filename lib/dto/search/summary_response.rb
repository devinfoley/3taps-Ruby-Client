class SummaryResponse < Struct.new(:totals, :execTimeMs) do
    def exec_time_ms
      execTimeMs
    end
  end
end
