defmodule Insert do
  def build_offers(offers) do
    offers
    |> Enum.group_by(& &1["university"], &Map.delete(&1, "university"))
    |> Map.to_list()
    |> Enum.map(fn {university, offers} ->
      Map.put(university, "campus", build_campus(offers))
    end)
  end

  def build_campus(offers) do
    offers
    |> Enum.group_by(& &1["campus"], fn offer ->
      course =
        offer
        |> Map.get("course")

      offer = offer |> Map.delete("course") |> Map.delete("campus")

      Map.put(course, "scolarships", [offer])
    end)
    |> Map.to_list()
    |> Enum.map(fn {campus, courses} ->
      campus
      |> Map.put("courses", courses)
    end)
  end
end

offers =
  File.read!("db.json")
  |> Jason.decode!()
  |> Insert.build_offers()
  |> Enum.each(&OffersCourse.Services.ScholarShips.execute/1)
