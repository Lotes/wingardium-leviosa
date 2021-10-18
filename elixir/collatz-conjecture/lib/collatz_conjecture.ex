defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input)
    when not is_integer(input)
    or input === 0, do: raise FunctionClauseError
  def calc(input) when input >= 1 do
    Stream.unfold(input, fn x -> {x, step(x)} end)
    |> Stream.take_while(fn x -> x != 1 end)
    |> Enum.to_list()
    |> Enum.count()
  end

  defp step(input) do
    case Integer.mod(input, 2) do
      1 ->  input * 3 + 1
      0 ->  div(input, 2)
    end
  end
end
