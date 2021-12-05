defmodule WeatherForecast.CLI.CityChoice do
  alias Mix.Shell.IO, as: Shell
  import WeatherForecast.CLI.BaseCommands

  def start do
    Shell.cmd("clear")
    Shell.info("Choose one of the cities :\n")

    cities = WeatherForecast.City.all()
    find_city_by_index = &Enum.at(cities, &1)

    cities
    |> get_valid_option
    |> find_city_by_index.()
  end
end
