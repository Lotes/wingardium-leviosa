defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      unless the year is also evenly divisible by 400
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    by4   = Integer.mod(year, 4) == 0
    by100 = Integer.mod(year, 100) == 0
    by400 = Integer.mod(year, 400) == 0
    by4 and not(by100 and not by400)
  end
end
