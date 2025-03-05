import Config

config :swoosh, api_client: Swoosh.ApiClient.Finch, finch_name: BulmaExample.Finch

config :swoosh, local: false

config :logger,
  level: :info,
  backends: [:console]
