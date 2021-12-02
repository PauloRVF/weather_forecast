defmodule Mix.Tasks.Start do
  use Mix.Task

  def run(_), do: WeatherForecast.CLI.Main.run()
end
