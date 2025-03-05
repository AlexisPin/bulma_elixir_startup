use Mix.Config

config :bulma_example, BulmaExampleWeb.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [host: "example.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true,
  root: ".",
  version: Mix.Project.config[:version],
  code_reloader: false,
  check_origin: false,
  watchers: []
