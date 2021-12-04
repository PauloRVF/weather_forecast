defmodule WeatherForecast.CLI.LanguageChoice do
  alias Mix.Shell.IO, as: Shell

  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {item, index} ->
      Shell.info("#{index} - #{item.description}")
    end)

    options
  end

  defp generate_question(options) do
    opts = Enum.join( Enum.map(options, &(&1.name)), "," )
    "\nWhich one? [#{opts}]\n"
  end

  defp parse_answer(answer) do
    {option, _} = Integer.parse(answer)
    option - 1
  end

  def start do
    Shell.cmd("clear")
    Shell.info("Choose the language to display infos (City name and description)\n")

    languages = WeatherForecast.Language.all()
    find_unit_by_index = &Enum.at(languages, &1)

    languages
    |> display_options
    |> generate_question
    |> Shell.prompt
    |> parse_answer
    |> find_unit_by_index.()
  end
end
