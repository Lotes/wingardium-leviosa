defmodule Wingardium.Repo.Migrations.CreateMetaTags do
  use Ecto.Migration

  def change do
    create table(:meta_tags) do
      add :name, :string
      add :color, :string
      add :order_index, :decimal

      timestamps()
    end
  end
end
