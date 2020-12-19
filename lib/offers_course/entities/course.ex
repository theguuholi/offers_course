defmodule OffersCourse.Entities.Course do
  use Ecto.Schema
  import Ecto.Changeset

  schema "courses" do
    field :name, :string
    field :kind, :string
    field :level, :string
    field :shift, :string
    belongs_to :campus, OffersCourse.Entities.Campus
    has_many :scolarships, OffersCourse.Entities.Scolarship

    timestamps()
  end

  @doc false
  def changeset(university, attrs) do
    university
    |> cast(attrs, [
      :name,
      :kind,
      :level,
      :shift
    ])
    |> cast_assoc(:scolarships, with: &OffersCourse.Entities.Scolarship.changeset/2)
    |> validate_required([
      :name,
      :kind,
      :level,
      :shift
    ])
  end
end
