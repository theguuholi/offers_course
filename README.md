

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



Table scolar_ship as p{
  id int [pk, increment]
  full_price decimal
  price_with_discount decimal
  discount_percentage decimal
  start_date datetime
  enrollment_semester text
  enable boolean
  }

Ref: course.scolar_ship_id > scolar_ship.id

Table course {
  id int [pk, increment]
  name text
  kind text
  level text
  shift text
  scolar_ship_id integer
}


Table campus {
  id int [pk, increment]
  name text
  city text
  course_id integer
  university_id integer
}

Ref: campus.course_id > course.id

Table university {
  id int [pk, increment]
  name text
  score decimal
  logo_url decimal
  campus_id integer
}

Ref: university.campus_id > campus.id





//Ref: students.personal_id > personals.id


