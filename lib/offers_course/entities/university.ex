defmodule OffersCourse.Entities.University do
  use Ecto.Schema
  import Ecto.Changeset

  alias OffersCourse.Entities.Campus

  schema "universities" do
    field :logo_url, :string
    field :name, :string
    field :score, :decimal

    has_many :campus, Campus
    timestamps()
  end

  @doc false
  def changeset(university, attrs) do
    university
    |> cast(attrs, [:name, :score, :logo_url])
    |> unique_constraint(:name)
    |> cast_assoc(:campus, with: &Campus.changeset/2)
    |> validate_required([:name, :score, :logo_url])
  end
end
