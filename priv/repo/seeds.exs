File.read!("db.json")
|> Jason.decode!()
|> Enum.group_by(fn s ->
  s["university"]
end)
|> Enum.map(fn {university, campus} ->
  campus =
    campus
    |> Enum.map(&Map.delete(&1, "university"))
    |> Enum.group_by(& &1["campus"])
    |> Enum.map(fn {campus, curso} ->
      curso =
        curso
        |> Enum.map(fn curso ->
          curso = Map.delete(curso, "campus")

          new_course = curso["course"]
          oferta = curso |> Map.delete("course")
          new_course
          # curso = Map.put(new_course, "scolarships", [oferta])
        end)

      campus
      |> Map.put("courses", curso)
    end)

  Map.put(university, "campus", campus)
end)
# |> List.first()
# |> IO.inspect()
|> OffersCourse.Services.ScholarShips.execute()

# campus = scholar_ship["campus"]
# course = scholar_ship["course"]
# university = scholar_ship["university"]

# scholar_ship =
#   scholar_ship
#   |> Map.delete("university")
#   |> Map.delete("campus")
#   |> Map.delete("course")

# OffersCourse.Services.ScholarShips.execute(scholar_ship, campus, course, university)
# course
# |> Enum.count()
|> IO.inspect()
