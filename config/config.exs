import Config

app_url = System.get_env("APP_URL")
api_url = System.get_env("API_URL")
platform_host = System.get_env("PLATFORM_HOST") || "localhost"

config :bulma_example,
  ecto_repos: [BulmaExample.Repo],
  generators: [timestamp_type: :utc_datetime, binary_id: true],
  http_client_opts: [],
  app_url: app_url,
  api_url: api_url,
  cookie_domain: if(platform_host == "localhost", do: "localhost", else: ".#{platform_host}")

config :bulma_example, BulmaExampleWeb.Endpoint,
  url: [host: platform_host],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: BulmaExampleWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: BulmaExample.PubSub,
  live_view: [signing_salt: "usLQ8Pbe"]

config :bulma_example, BulmaExample.Mailer, adapter: Swoosh.Adapters.Local

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  bulma_example: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.4.3",
  bulma_example: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
