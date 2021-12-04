defmodule WeatherForecast.CLI.Main do
  alias Mix.Shell.IO, as: Shell
  alias WeatherForecast.OWClient
  alias WeatherForecast.CLI.LanguageChoice
  alias WeatherForecast.CLI.MeasurementSystemChoice
  alias WeatherForecast.CLI.CityChoice


  def run do
    welcome_message()
    Shell.prompt("Press enter to continue")

    measurement = measurement_system_choice()
    language = language_choice()

    Shell.cmd("clear")
    Shell.info("Well. After all configured lets check the weather of some cities")
    Shell.prompt("Press enter to continue")

    city_selection(measurement, language)
  end

  def welcome_message do
    Shell.cmd("clear")
    Shell.info("=+= Weather Forecast =+=")
    Shell.info("You can check the Weather in real time for some cities")
  end

  def city_selection(measurement, language) do
    city = city_choice()

    format_and_print_result(measurement, language, city)
    Shell.prompt("\n\nPress 1 to check another city or something else to exit")
    |> String.trim
    |> case do
      "1" -> city_selection(measurement, language)
      _   -> System.halt
    end
  end

  def format_and_print_result(measurement, language, city) do
    Shell.cmd("clear")

    OWClient.check_city_weather(measurement, language, city)
    |> OWClient.format_output_from_json(measurement)
  end

  def measurement_system_choice() do
    MeasurementSystemChoice.start()
  end

  def language_choice() do
    LanguageChoice.start()
  end

  def city_choice() do
    CityChoice.start()
  end
end
