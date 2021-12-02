defmodule WeatherForecast.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def run do
    welcome_message()
    Shell.prompt("Press enter to continue")

    measurement = measurement_system_choice()
    language = language_choice()

    Shell.info("Well. After all configured lets check the weather of some cities")
    Shell.prompt("Press enter to continue")

    flow_control(measurement, language)
  end

  def welcome_message do
    Shell.cmd("clear")
    Shell.info("=+= Weather Forecast =+=")
    Shell.info("You can check the Weather in real time for some cities")
  end

  def flow_control(measurement, language) do
    city_choice()
  end

  def measurement_system_choice() do
    WeatherForecast.CLI.MeasurementSystemChoice.start()
  end

  def language_choice() do
    WeatherForecast.CLI.LanguageChoice.start()
  end

  def city_choice() do
    WeatherForecast.CLI.CityChoice.start()
  end
end
