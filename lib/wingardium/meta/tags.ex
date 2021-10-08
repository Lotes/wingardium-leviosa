defmodule Wingardium.Meta.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  alias Wingardium.Repo
  alias Wingardium.Meta.Tag

  schema "meta_tags" do
    field :color, :string
    field :name, :string
    field :order_index, :decimal

    timestamps()
  end

  @doc false
  def changeset(tags, attrs) do
    tags
    |> cast(attrs, [:name, :color, :order_index])
    |> validate_required([:name, :color, :order_index])
  end

  def create(attrs \\ %{}) do
    %Tag{}
    |> changeset(attrs)
    |> Repo.insert()
  end

  def get!(id), do: Repo.get!(Tag, id)

  @spec list :: any
  def list do
    Repo.all(Tag)
  end

  def update(%Tag{} = tag, attrs) do
    tag
    |> Tag.changeset(attrs)
    |> Repo.update()
  end
end
