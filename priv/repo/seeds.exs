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
|> Enum.each(&OffersCourse.Services.ScholarShips.execute/1)
|> IO.inspect()
