defmodule OffersCourse.Repo.Migrations.CreateCourse do
  use Ecto.Migration

  def change do
      create table(:courses) do
        add :name, :string
        add :kind, :string
        add :level, :string
        add :shift, :string
        add :campus_id, references(:campus, on_delete: :nilify_all, on_update: :nilify_all)
        timestamps()
      end
  end
end
