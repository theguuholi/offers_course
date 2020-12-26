defmodule Insert do
  def build_offers(offers) do
    offers
    |> Enum.group_by(& &1["university"])
    |> controi_campos()
  end

  def controi_campos(universidades) do
    universidades
    |> Enum.map(fn {university, campus} ->
      campus =
        campus
        |> Enum.map(&Map.delete(&1, "university"))
        |> Enum.group_by(& &1["campus"])
        |> Enum.map(&constroi_cursos/1)

      Map.put(university, "campus", campus)
    end)
  end

  def constroi_cursos({campus, cursos}) do
    cursos =
      cursos
      |> Enum.map(fn curso ->
        curso = Map.delete(curso, "campus")
        new_course = curso["course"]
        oferta = curso |> Map.delete("course")
        Map.put(new_course, "scolarships", [oferta])
      end)

    Map.put(campus, "courses", cursos)
  end
end

offers =
  File.read!("db.json")
  |> Jason.decode!()

offers
|> Insert.build_offers()
|> Enum.each(&OffersCourse.Services.ScholarShips.execute/1)

IO.inspect(
  "Ofertas #{
    offers
    |> Enum.count()
  }"
)

IO.inspect(
  "Campus #{
    offers
    |> Enum.uniq_by(& &1["campus"]["name"])
    |> Enum.count()
  }"
)


IO.inspect(
  "Facu #{
    offers
    |> Enum.uniq_by(& &1["university"]["name"])
    |> Enum.count()
  }"
)
