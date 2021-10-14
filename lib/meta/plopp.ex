defmodule Meta.TypeSystem do
  defmodule TypeNameAlreadyExists do
    defexception [:message]

    @impl true
    def exception(value) do
      msg = "A type named '#{inspect(value)}' already exists!"
      %__MODULE__{message: msg}
    end
  end

  def new() do
    %{
      :types => %{
        #{:name} -> ???
      },
      :props => %{
        #{:type_name, :property_name} -> %{
        #  :tags => property_tags...,
        #  :compute? => fn/3(type, property, instance) or list_of_commands
        #  :type => type
        #}

        #property_tags = [
        # :nullable, :public
        #]
      },
      :deps => %{
        #{:from_name, :to_name, :dep_type} -> data
        # dep_type # data
        # :base  -> :to extends :from
        # :iface -> :to implements :from
      }
    }
  end

  def new_type(type_system, type_name)
    when is_atom(type_name) do
      types = type_system.types
      case Map.fetch(types, type_name)  do
        {:ok, _} -> raise TypeNameAlreadyExists, type_name
        _ ->
          type = %{
            :props => %{},
          }
          new_types = Map.put(type_system, type_name, type)
          Map.put(type_system, :types, new_types)
      end
  end
end
