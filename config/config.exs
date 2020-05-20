# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :myApp,
  ecto_repos: [MyApp.Repo]

# Configures the endpoint
config :myApp, MyAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rq8acOIcO/jh9M+zFIJgbr7CotEPZJilpEKyz7QyKLvDWBExuO/+Jy5G+EHsP+/F",
  render_errors: [view: MyAppWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: MyApp.PubSub,
  live_view: [signing_salt: "z8+le4jC"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :myApp, :pow,
  user: MyApp.Users.User,
  repo: MyApp.Repo,
  web_module: MyAppWeb,
  extensions: [PowResetPassword, PowEmailConfirmation],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  mailer_backend: MyAppWeb.Pow.Mailer,
  web_mailer_module: MyAppWeb
