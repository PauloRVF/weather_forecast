defmodule WeatherForecast.City do
  defmodule City do
    defstruct name: nil,
              id: nil
  end
  @type t :: %City{
    name: String.t,
    id: non_neg_integer
  }

  def all, do: [
    %City{name: "São Paulo, SP - BR", id: 3448439},
    %City{name: "Rio de Janeiro, RJ - BR", id: 3451190},
    %City{name: "Salvador, BA - BR", id: 3450554},
    %City{name: "Caraguatatuba, SP - BR", id: 3467081},
    %City{name: "Gramado, RS - BR", id: 3462284}
  ]
end
