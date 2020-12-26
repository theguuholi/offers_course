defmodule OffersCourse.Repo.Migrations.CreateScolarShip do
  use Ecto.Migration

  def change do

    create table(:scolarships) do
      add :full_price, :decimal
      add :price_with_discount, :decimal
      add :discount_percentage, :decimal
      # add :start_date, :naive_datetime
      add :enrollment_semester, :string
      add :enabled, :boolean
      add :course_id, references(:courses, on_delete: :nilify_all, on_update: :nilify_all)
      timestamps()
    end
  end
end
