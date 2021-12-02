defmodule WeatherForecast.MeasurementUnit do
  defmodule Unit do
    defstruct name: nil,
      description: nil,
      symbol: nil
  end

  def all, do: [
    %Unit{name: "standard", description: "Uses Kelvin for temperature. *Default Option*.", symbol: "K"},
    %Unit{name: "metric", description: "Uses Celsius.", symbol: "C"},
    %Unit{name: "imperial", description: "Uses Fahrenheit.", symbol: "F"}
  ]
end
