import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :wingardium, Wingardium.Repo,
  username: "postgres",
  password: "postgres",
  database: "wingardium_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :wingardium, WingardiumWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "DjWi4r5U6uh4w50n/E1aKdHBYZuAro8WF39q20DnIPa8I8a6b7ySRUvJs1sx/3iQ",
  server: false

# In test we don't send emails.
config :wingardium, Wingardium.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
