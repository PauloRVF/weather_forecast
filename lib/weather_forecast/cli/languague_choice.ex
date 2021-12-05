defmodule WeatherForecast.CLI.LanguageChoice do
  alias Mix.Shell.IO, as: Shell
  import WeatherForecast.CLI.BaseCommands

  def start do
    Shell.cmd("clear")
    Shell.info("Choose the language to display infos (City name and description)\n")

    languages = WeatherForecast.Language.all()
    find_unit_by_index = &Enum.at(languages, &1)

    languages
    |> get_valid_option
    |> find_unit_by_index.()
  end
end
