defmodule OffersCourse.Entities.Campus do
  use Ecto.Schema
  import Ecto.Changeset

  schema "campus" do
    field :name, :string
    field :city, :string
    belongs_to :university, OffersCourse.Entities.University
    timestamps()
  end

  @doc false
  def changeset(university, attrs) do
    university
    |> cast(attrs, [:name, :city])
    |> unique_constraint(:name)
    |> validate_required([:name, :city])
  end
end
