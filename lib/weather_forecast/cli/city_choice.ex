defmodule WeatherForecast.CLI.CityChoice do
  alias Mix.Shell.IO, as: Shell

  defp display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("#{index} - #{option}")
    end)

    options
  end

  defp generate_question(options) do
    opts = Enum.join(1..Enum.count(options), ",")
    "\nWhich one? [#{opts}]\n"
  end

  defp parse_answer(answer) do
    {option, _} = Integer.parse(answer)
    option - 1
  end

  def start do
    Shell.cmd("clear")
    Shell.info("Choose one of the cities :\n")

    cities = WeatherForecast.City.all()
    find_city_by_index = &Enum.at(cities, &1)

    cities
    |> display_options
    |> generate_question
    |> Shell.prompt
    |> parse_answer
    |> find_city_by_index.()
  end
end
