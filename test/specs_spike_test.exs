defmodule SpecsSpikeTest do
  use ExUnit.Case
  doctest SpecsSpike

  test "day ranges" do
    {:ok, from, _} = DateTime.from_iso8601("2018-01-01T00:00:00+00:00")
    {:ok, to, _} = DateTime.from_iso8601("2018-01-05T00:00:00+00:00")
    SpecsSpike.get_days_ranges({from, to}) |> IO.inspect
  end
end
