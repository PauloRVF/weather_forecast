defmodule WeatherForecast.CLI.LanguageChoice do
  alias Mix.Shell.IO, as: Shell


  def start do
    Shell.cmd("clear")
    Shell.info("Choose the language to display infos (City name and description)\n")

    languages = WeatherForecast.Language.all()
    find_unit_by_name = fn name -> Enum.find(languages, &(&1.name == name)) end

    languages
    |> display_options
    |> generate_question
    |> Shell.prompt
    |> String.trim
    |> find_unit_by_name.()
    |> IO.inspect()
  end

  def display_options(options) do
    options
    |> Enum.each(fn item ->
      Shell.info("#{item.name} - #{item.description}")
    end)

    options
  end

  defp generate_question(options) do
    opts = Enum.join( Enum.map(options, &(&1.name)), "," )
    "\nWhich one? [#{opts}]\n"
  end
end
