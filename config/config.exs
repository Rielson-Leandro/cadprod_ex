# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cadProd_ex,
  ecto_repos: [CadProdEx.Repo]

# Configures the endpoint
config :cadProd_ex, CadProdExWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gWzfoekxXhUrtqXtYVJ5Y9gDK0oRH03B3prj0LP+LPEZvO14D2/zuAUuKBi81Q3g",
  render_errors: [view: CadProdExWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CadProdEx.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"