defmodule WeatherForecast.OWClient do
  def check_city_weather(measurement, language, city) do
    appid = "fd63bc446b1d8f21cd9062f1764f8a49"
    uri = "api.openweathermap.org/data/2.5/weather?appid=\
#{appid}&id=#{city.id}&units=#{measurement.name}&lang=#{language.name}"

    HTTPoison.start()
    %{body: response } = HTTPoison.get!(uri)

    Jason.decode!(response)
  end

  @spec format_output_from_json(nil | maybe_improper_list | map, any) :: :ok
  def format_output_from_json(json, measurement) do

    dt_requisition = fn json -> timestamp_to_string json["dt"] end
    weather_description = fn json ->
      json["weather"]
      |> Enum.at(0)
      |> Map.get("description")
    end
    sys_country = fn json ->
      json["sys"]["country"]
    end
    temp_min = fn json ->
      "#{json["main"]["temp_min"]}°#{measurement.symbol}"
    end
    temp_max = fn json ->
      "#{json["main"]["temp_max"]}°#{measurement.symbol}"
    end
    temp_feels = fn json ->
      "#{json["main"]["feels_like"]}°#{measurement.symbol}"
    end
    temp_actual = fn json ->
      "#{json["main"]["temp"]}°#{measurement.symbol}"
    end

    IO.puts '''
    The current weather for the city of #{json["name"]}, #{sys_country.(json)}
    At #{dt_requisition.(json)} UTC is:
    #{weather_description.(json)} being between #{temp_min.(json)} and #{temp_max.(json)}.
    Actually is #{temp_actual.(json)} and feels like #{temp_feels.(json)}.
    '''
  end

  #

  defp timestamp_to_string(timestamp) do
    DateTime.from_unix(timestamp, :second)
    |> elem(1)
    |> DateTime.to_string()
  end
end
