defmodule Meta.TagsTest do
  use Wingardium.DataCase
  alias Wingardium.Meta.Tag

  describe "tags" do
    @valid_attrs %{name: "some text", color: "red", order_index: 123}
    @update_attrs %{name: "some updated text", color: "blue"}
    @invalid_attrs %{name: nil}

    def tag_fixture(attrs \\ %{}) do
      {:ok, tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tag.create()
      tag
    end

    test "get!/1 returns the tag with given id" do
      tag = tag_fixture(@valid_attrs)
      assert Tag.get!(tag.id) == tag
    end

    test "create/1 with valid data creates a tag" do
      assert {:ok, %Tag{} = tag} = Tag.create(@valid_attrs)
      assert tag.name == "some text"

      inserted_tag = List.first(Tag.list())
      assert inserted_tag.name == @valid_attrs.name
    end

    test "create/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tag.create(@invalid_attrs)
    end

    test "list_items/0 returns a list of tags stored in the DB" do
      tag1 = tag_fixture()
      tag2 = tag_fixture()
      items = Tag.list()
      assert Enum.member?(items, tag1)
      assert Enum.member?(items, tag2)
    end

    test "update/2 with valid data updates the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{} = tag} = Tag.update(tag, @update_attrs)
      assert tag.name == "some updated text"
    end
  end
end
