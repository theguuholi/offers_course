defmodule OffersCourse.Repo do
  use Ecto.Repo,
    otp_app: :offers_course,
    adapter: Ecto.Adapters.Postgres
end
