File.read!("db.json")
|> Jason.decode!()
|> Enum.group_by(& &1["university"])
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
