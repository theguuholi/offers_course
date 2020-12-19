defmodule OffersCourse.Services.ScholarShips do
  alias OffersCourse.Repo
  alias OffersCourse.Entities.University

  def execute(scholar_ship, campus, course, university) do
    Repo.get_by(University, name: university["name"])
    |> case do
      nil ->
        University.changeset(%University{}, university)
        |> Repo.insert()

      university ->
        "Existe essa merda"
    end
    |> IO.inspect()
  end
end
