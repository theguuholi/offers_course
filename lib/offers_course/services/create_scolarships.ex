defmodule OffersCourse.Services.ScholarShips do
  alias OffersCourse.Repo
  alias OffersCourse.Entities.University
  alias OffersCourse.Entities.Campus

  def execute(scholar_ship, campus, course, university) do
    Repo.get_by(University, name: university["name"])
    |> case do
      nil ->
        campus =
          campus
          |> Map.put("courses", [course])

        university =
          university
          |> Map.put("campus", [campus])

        University.changeset(%University{}, university)
        |> Repo.insert_or_update()

      university ->
        university
        |> Ecto.build_assoc(:campus)
        |> Campus.changeset(campus)
        |> Repo.insert()

        # |> IO.inspect()
    end
  end
end
