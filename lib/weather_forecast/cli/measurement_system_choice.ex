defmodule WeatherForecast.CLI.MeasurementSystemChoice do
  alias Mix.Shell.IO, as: Shell
  import WeatherForecast.CLI.BaseCommands

  def start do
    Shell.cmd("clear")
    Shell.info("Choose the metric system : \n")

    units = WeatherForecast.MeasurementUnit.all()

    find_unit_by_index = &Enum.at(units, &1)

    units
    |> get_valid_option
    |> find_unit_by_index.()
  end
end
