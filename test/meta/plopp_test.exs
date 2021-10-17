defmodule Meta.TypeSystemTest do
  use ExUnit.Case
  doctest Meta.TypeSystem

  test "TypeSystem.new_type/2 creates new type" do
    system = Meta.TypeSystem.new()
    {:ok, result1, id1} = Meta.TypeSystem.new_type(system)
    {:ok, _, id2} = Meta.TypeSystem.new_type(result1)
    assert id1 != id2
  end
end
