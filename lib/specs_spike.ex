defmodule SpecsSpike do
  @spec get_days_ranges(from_to :: {DateTime.t(), DateTime.t()}) :: [{DateTime.t(), DateTime.t()}]
  def get_days_ranges(from_to), do: get_days_ranges(from_to, [])

  @spec get_days_ranges({DateTime.t(), DateTime.t()}, acc: [{DateTime.t(), DateTime.t()}]) :: [
          {DateTime.t(), DateTime.t()}
        ]
  defp get_days_ranges({from, from}, acc), do: acc

  defp get_days_ranges({from, to}, acc) do
    {new_to, day_range} =
      if Timex.equal?(from, to, :days) do
        {from, {from, to}}
      else
        day_range = {Timex.beginning_of_day(to), to}
        new_to = Timex.add(to, Timex.Duration.from_days(-1)) |> Timex.end_of_day()
        {new_to, day_range}
      end

    get_days_ranges({from, new_to}, [day_range | acc])
  end
end
