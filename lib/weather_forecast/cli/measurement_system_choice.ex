defmodule WeatherForecast.CLI.MeasurementSystemChoice do
  alias Mix.Shell.IO, as: Shell

  def start do
    Shell.cmd("clear")
    Shell.info("Choose the metric system : ")

    units = WeatherForecast.MeasurementUnit.all()

    find_unit_by_index = &Enum.at(units, &1)

    units
    |> display_options
    |> generate_question
    |> Shell.prompt
    |> parse_answer
    |> find_unit_by_index.()
    |> IO.inspect
  end

  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("#{index} - #{option.description}")
    end)

    options
  end

  defp generate_question(options) do
    opts = Enum.join(1..Enum.count(options), ",")
    "Which one? [#{opts}]\n"
  end

  defp parse_answer(answer) do
    {option, _} = Integer.parse(answer)
    option - 1
  end
end