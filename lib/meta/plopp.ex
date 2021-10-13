defmodule Meta.TypeSystemServer do
  use GenServer

  ### GenServer callbacks ###
  @impl true
  def init(_init_arg) do
    {:ok, %{}}
  end

  @impl true
  def handle_call(_request, _caller, state) do
    {:reply, nil,  state}
  end

  @impl true
  def handle_cast(_request, state) do
    {:noreply, state}
  end
end

defmodule Meta.TypeSystemBuilder do

end

defmodule Meta.TypeBuilder do
  def new() do
    %{
      :props => %{},
      :params => %{},
      :supers => %{}
    }
  end

  def add_property(type, property_name, new_property) do
    props = Map.fetch!(type, :props)
    case Map.fetch!(props, property_name) do
      {:ok, _} -> :error
      :error ->
        new_props = Map.put(props, property_name, new_property)
        Map.put(type, :props, new_props)
    end
  end

  def remove_property(type, property_name) do
    props = Map.fetch!(type, :props)
    new_props = Map.delete(props, property_name)
    Map.put(type, :props, new_props)
  end
end

defmodule Meta.PropertyBuilder do

end
