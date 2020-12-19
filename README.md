

seeds

offers =
  File.read!("db.json")
  |> Jason.decode!()
  |> Enum.map(fn scholar_ship ->
    scholar_ship
    campus = scholar_ship["campus"]
    course = scholar_ship["course"]
    university = scholar_ship["university"]

    scholar_ship = scholar_ship
    |> Map.delete("university")
    |> Map.delete("campus")
    |> Map.delete("course")

    {scholar_ship, campus, course, university}
  end)
  |> IO.inspect()



❯ mix ecto.gen.migration create_university

  schema "universities" do
    field :logo_url, :string
    field :name, :string
    field :score, :decimal

    timestamps()
  end

❯ mix ecto.gen.migration create_campus


