defmodule WeatherForecast.CLI.BaseCommands do
  alias Mix.Shell.IO, as: Shell

  defp display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("#{index} - #{option}")
    end)

    options
  end

  defp generate_question(options) do
    opts = Enum.join(1..Enum.count(options), ",")
    "\nWhich one? [#{opts}]: "
  end

  defp get_option(options) do
    options
    |> display_options
    |> generate_question
    |> Shell.prompt
    |> parse_answer
  end

  def get_valid_option(options) do
    opt = get_option(options)

    if is_valid_option(opt, options) do
      opt
    else
      Shell.info("\n\nInvalid option .. Let's try again :\n")
      get_valid_option(options)
    end
  end

  defp is_valid_option(selected_option, options) do
    (selected_option >= 0) and (selected_option < Enum.count options)
  end

  defp parse_answer(answer) do
    {option, _} = Integer.parse(answer)
    option - 1
  end

end
