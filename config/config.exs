# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :menu_planner,
  ecto_repos: [MenuPlanner.Repo]

# Configures the endpoint
config :menu_planner, MenuPlanner.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "scUbwIKGIoTjYJer6KB0hl0SWOXu2PpPtPT4kmUPPFJhLvt251Ndd/c24H6cxSrC",
  render_errors: [view: MenuPlanner.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MenuPlanner.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
