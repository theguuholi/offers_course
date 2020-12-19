defmodule OffersCourse.Entities.Campus do
  use Ecto.Schema
  import Ecto.Changeset

  alias OffersCourse.Entities.Course

  schema "campus" do
    field :name, :string
    field :city, :string
    belongs_to :university, OffersCourse.Entities.University
    has_many :courses, Course

    timestamps()
  end

  @doc false
  def changeset(university, attrs) do
    university
    |> cast(attrs, [:name, :city])
    |> unique_constraint(:name)
    |> cast_assoc(:courses, with: &Course.changeset/2)
    |> validate_required([:name, :city])
  end
end
