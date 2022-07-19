import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :demo_call_api_with_finch_elixir, DemoCallApiWithFinchElixirWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "7WadfccqpIDifLM9Z50D5waEKl7GHkr/vRaqsnN84x0PNg4o+ZX88lvPZ3JYySIK",
  server: false

# In test we don't send emails.
config :demo_call_api_with_finch_elixir, DemoCallApiWithFinchElixir.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
