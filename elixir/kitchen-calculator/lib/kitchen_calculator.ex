defmodule KitchenCalculator do
  def get_volume({_unit, volume}), do: volume

  def to_milliliter({unit, _} = volume_pair) do
    milliliter = case unit do
      :cup -> 240.0
      :fluid_ounce ->  30.0
      :teaspoon -> 5.0
      :tablespoon -> 15.0
      :milliliter -> 1.0
    end
    {:milliliter, get_volume(volume_pair) * milliliter}
  end

  def from_milliliter({:milliliter, volume}, unit) do
    {unit, volume / get_volume(to_milliliter({unit, 1}))}
  end

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair)
    |> from_milliliter(unit)
  end
end
