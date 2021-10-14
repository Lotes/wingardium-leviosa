defmodule Meta.TypeSystemTest do
  use ExUnit.Case
  doctest Meta.TypeSystem

  test "TypeSystem.new_type/2 creates type if name not known" do
    system = Meta.TypeSystem.new()
    new_system = Meta.TypeSystem.new_type(system, :array)
    assert %{:types  => %{ :array => _type }} = new_system
  end

  test "TypeSystem.new_type/2 raises error if type name is known" do
    empty_system = Meta.TypeSystem.new()
    system = Meta.TypeSystem.new_type(empty_system, :array)
    assert_raise Meta.TypeSystem.TypeNameAlreadyExists, fn ->
      Meta.TypeSystem.new_type(system, :array)
    end
  end
end
