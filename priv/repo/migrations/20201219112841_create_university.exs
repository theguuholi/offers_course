defmodule OffersCourse.Repo.Migrations.CreateUniversity do
  use Ecto.Migration

  def change do
    create table(:universities) do
      add :logo_url, :string
      add :name, :string
      add :score, :decimal
      timestamps()
    end
    create(unique_index(:universities, [:name]))
  end
end
