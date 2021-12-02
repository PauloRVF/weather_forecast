defmodule WeatherForecast.Language do
  defmodule Lang do
    defstruct name: nil,
              description: nil
  end

  @type t :: %Lang{
    name: String.t,
    description: String.t
  }

  def all, do: [
    %Lang{name: "en", description: "English. *Default Option*."},
    %Lang{name: "pt_br", description: "Brazilian Portuguese."},
    %Lang{name: "de", description: "Deutsch"}
  ]
end
