defmodule OffersCourse.Universities.University do
  use Ecto.Schema
  import Ecto.Changeset

  schema "universities" do
    field :logo_url, :string
    field :name, :string
    field :score, :decimal

    timestamps()
  end

  @doc false
  def changeset(university, attrs) do
    university
    |> cast(attrs, [:name, :score, :logo_url])
    |> unique_constraint(:name)
    |> validate_required([:name, :score, :logo_url])
  end
end
