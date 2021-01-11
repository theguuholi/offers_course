defmodule Insert do
  def build_offers(offers) do
    offers
    |> Enum.group_by(& &1["university"], &Map.delete(&1, "university"))
    |> Map.to_list()
    |> Enum.map(fn {u, o} -> Map.put(u, "campus", build_campus(o)) end)
  end

  def build_campus(offers) do
    offers
    |> Enum.group_by(& &1["campus"], &build_offer/1)
    |> Map.to_list()
    |> Enum.map(fn {campus, courses} -> Map.put(campus, "courses", courses) end)
  end

  def build_offer(offer) do
    course = Map.get(offer, "course")
    offer = offer |> Map.delete("course") |> Map.delete("campus")
    Map.put(course, "scolarships", [offer])
  end
end

offers =
  File.read!("db.json")
  |> Jason.decode!()
  |> Insert.build_offers()
  |> Enum.each(&OffersCourse.Services.ScholarShips.execute/1)
