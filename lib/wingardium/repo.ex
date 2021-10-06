defmodule Wingardium.Repo do
  use Ecto.Repo,
    otp_app: :wingardium,
    adapter: Ecto.Adapters.Postgres
end
