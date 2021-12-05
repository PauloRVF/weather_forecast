use Mix.Config

config :open_weather,
  api_key: System.get_env("OPEN_WEATHER_APPKEY")
