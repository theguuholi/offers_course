defmodule OffersCourse.Repo.Migrations.CreateUniversities do
  use Ecto.Migration

  def change do
    create table(:universities) do
      add :name, :string
      add :score, :decimal
      add :logo_url, :string

      timestamps()
    end

    create(unique_index(:universities, [:name]))
  end
end
