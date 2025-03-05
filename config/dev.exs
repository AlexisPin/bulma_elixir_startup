import Config

config :bulma_example,
  dev_routes: true

config :bulma_example, BulmaExample.Repo,
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we can use it
# to bundle .js and .css sources.
# Binding to loopback ipv4 address prevents access from other machines.
config :bulma_example, BulmaExampleWeb.Endpoint,
  # Change to `ip: {0, 0, 0, 0}` to allow access from other machines.
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "9/NEzAl3C7sCAlbO7GaJOPZ3Xjrw4DZBTRVxwi59pG9/wCg988TsN99pj2zNSnMf",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:bulma_example, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:bulma_example, ~w(--watch)]}
  ]

config :bulma_example, BulmaExampleWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/bulma_example_web/(controllers|live|components)/.*(ex|heex)$"
    ]
  ]

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime

config :phoenix_live_view,
  # Include HEEx debug annotations as HTML comments in rendered markup
  debug_heex_annotations: true,
  # Enable helpful, but potentially expensive runtime checks
  enable_expensive_runtime_checks: true

config :swoosh, :api_client, false
