defmodule Meta.TypeSystem do
  defmodule Errors do
    defmodule TypeNameAlreadyExists do
      defexception [:message]

      @impl true
      def exception(value) do
        msg = "A type named '#{inspect(value)}' already exists!"
        %__MODULE__{message: msg}
      end
    end
  end

  def new() do
    %{
      :sequence_type_id => 0,
      :nodes => %{
        #{:type, type_id} -> %{
        #  :name? => name
        #  :tags => type_tags
        #}
        #{:prop,  type_id, property_name} -> %{
        #  :tags => property_tags...,
        #  :compute? => fn/3(type, property, instance) or list_of_commands
        #}
        #{:param, type_id, name} -> %{
        #
        #}

        #type_tags = [
        # :abstract, :iface
        #]

        #property_tags = [
        # :nullable,
        # :private,
        # :static
        #]
      },
      :deps => %{
        #{:dep_type, :from, :to} -> data
        # dep_type      -> roles                  -> data
        # :extends      -> :from extends     :to    ->
        #                  :type ->          :type  ->
        #                  :param ->         :type  ->
        #                  :param ->         :param ->
        # :impls        -> :from implements  :to    ->
        #                  :type ->          :type  ->
        #                  :param ->         :type  ->
        #                  :param ->         :param ->
        # :has_prop     -> :from contains    :to    ->
        #                  :type ->          :prop  ->
        # :has_param    -> :from has         :to    ->
        #                  :type ->          :param ->
        # :specialize   -> :from specializes :to    ->
        #                  :type ->          :type  -> Map<:name, type|param>
      }
    }
  end

  defmodule Builders do
    defmodule Nodes do
      def type_id(id)
        when is_number(id) do
        {:type, id}
      end

      def type_meta(name? \\ nil, tags \\ [])
        when is_atom(name?) or is_nil(name?)
        when is_list(tags) do
        %{
          :name => name?,
          :tags => tags
        }
      end
    end
  end

  def new_type(type_system) do
    new_id = type_system.sequence_type_id + 1
    new_type_id = Builders.Nodes.type_id(new_id)
    new_type_meta = Builders.Nodes.type_meta()
    new_system = Map.merge(type_system, %{
      :sequence_type_id => new_id,
      :nodes => Map.put(type_system.nodes, new_type_id, new_type_meta)
    })
    {:ok, new_system, new_id}
  end
end
