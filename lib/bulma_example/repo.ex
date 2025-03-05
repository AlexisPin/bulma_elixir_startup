defmodule BulmaExample.Repo do
  use Ecto.Repo,
    otp_app: :bulma_example,
    adapter: Ecto.Adapters.Postgres
end
