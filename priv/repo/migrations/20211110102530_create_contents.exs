defmodule Sns.Repo.Migrations.CreateContents do
  use Ecto.Migration

  def change do
    create table(:contents) do
      add :name, :string
      add :detail, :string

      timestamps()
    end
  end
end
