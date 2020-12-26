defmodule OffersCourse.Entities.Scolarship do
  use Ecto.Schema
  import Ecto.Changeset

  alias OffersCourse.Entities.Course

  schema "scolarships" do
    field :full_price, :decimal
    field :price_with_discount, :decimal
    field :discount_percentage, :decimal
    field :start_date, :naive_datetime
    field :enrollment_semester, :string
    field :enabled, :boolean
    belongs_to :course, Course

    timestamps()
  end

  @doc false
  def changeset(university, attrs) do
    university
    |> cast(attrs, [
      :full_price,
      :price_with_discount,
      :discount_percentage,
      # :start_date,
      :enrollment_semester,
      :enabled
    ])
    |> validate_required([
      :full_price,
      :price_with_discount,
      :discount_percentage,
      # :start_date,
      :enrollment_semester,
      :enabled
    ])
  end
end
