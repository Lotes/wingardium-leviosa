defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _key), do: :not_found
  def search(numbers, key) do
    length = Tuple.to_list(numbers)
      |> Enum.count()
    [result] = {0, length-1}
      |> Stream.iterate(fn x -> step(x, key, numbers) end)
      |> Stream.drop_while(fn x -> not is_atom(x) and not (is_tuple(x) and elem(x, 0) === :ok) end)
      |> Stream.take(1)
      |> Enum.to_list()
    result
  end

  def step({:ok, _index}, _key, _tuple), do: nil
  def step({lhs, rhs}, key, tuple) do
    left = elem(tuple, lhs)
    right = elem(tuple, rhs)
    cond do
      lhs === rhs and key === left -> {:ok, lhs}
      key < left or right < key    -> :not_found
      true ->
        m = div(lhs+rhs, 2)
        middle = elem(tuple, m)
        cond do
          left <= key and key <= middle -> {lhs, m}
          middle < key and key <= right -> {m+1, rhs}
        end
    end
  end
  def step(atom, _key, _tuple) when is_atom(atom) or is_nil(atom), do: nil
end
