# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :offers_course,
  ecto_repos: [OffersCourse.Repo]

# Configures the endpoint
config :offers_course, OffersCourseWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "s3InEoDYGfvo17uVPjqk8oLjNP56u7753zzGpmnPUmkKA6vqm8AL3M+L1bVC8kET",
  render_errors: [view: OffersCourseWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: OffersCourse.PubSub,
  live_view: [signing_salt: "ZUfJnbc8"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
