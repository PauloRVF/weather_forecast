defmodule WeatherForecast.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def run do
    welcome_message()
    Shell.prompt("Press enter to continue")
    measurement_system_choice()
  end

  def welcome_message do
    Shell.cmd("clear")
    Shell.info("=+= Weather Forecast =+=")
    Shell.info("You can check the Weather in real time for some cities")
  end

  def measurement_system_choice() do
    WeatherForecast.CLI.MeasurementSystemChoice.start()
  end
end
