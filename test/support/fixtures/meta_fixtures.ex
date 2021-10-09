defmodule Hello.MetaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Hello.Meta` context.
  """

  @doc """
  Generate a tag.
  """
  def tag_fixture(attrs \\ %{}) do
    {:ok, tag} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Hello.Meta.create_tag()

    tag
  end
end
