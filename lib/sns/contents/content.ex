defmodule Sns.Contents.Content do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contents" do
    field :detail, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(content, attrs) do
    content
    |> cast(attrs, [:name, :detail])
    |> validate_required([:name, :detail])
  end
end
