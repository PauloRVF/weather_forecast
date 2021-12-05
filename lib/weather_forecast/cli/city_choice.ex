defmodule WeatherForecast.CLI.CityChoice do
  alias Mix.Shell.IO, as: Shell
  import WeatherForecast.CLI.BaseCommands

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
