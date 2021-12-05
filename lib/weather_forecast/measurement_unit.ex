defmodule WeatherForecast.MeasurementUnit do
  defmodule Unit do
    defstruct name: nil,
      description: nil,
      symbol: nil

    defimpl String.Chars do
      def to_string(unit), do: unit.description
    end
  end
  @type t :: %Unit{
    name: String.t,
    description: String.t,
    symbol: String.t
  }

  def all, do: [
    %Unit{name: "standard", description: "Uses Kelvin for temperature.", symbol: "K"},
    %Unit{name: "metric", description: "Uses Celsius.", symbol: "C"},
    %Unit{name: "imperial", description: "Uses Fahrenheit.", symbol: "F"}
  ]
end
