defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add(a, b) do
    {na, da} = a
    {nb, db} = b
    {na*db + nb*da, da * db} |> reduce()
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b) do
    {na, da} = a
    {nb, db} = b
    {na*db - nb*da, da * db} |> reduce()
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(a, b) do
    {na, da} = a
    {nb, db} = b
    {na * nb, da * db} |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
    {na, da} = num
    {nb, db} = den
    {na * db, nb * da} |> reduce()
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({n, d}) do
    {Kernel.abs(n), Kernel.abs(d)} |> reduce()
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({_n, _d}, 0), do: {1, 1}
  def pow_rational({n, d}, 1), do: {n, d}
  def pow_rational({n, d}, x), do: multiply({n, d}, pow_rational({n, d}, x - 1)) |> reduce()

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {n, d}) do
    :math.pow(x, n/d)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce(a) do
    {n, d} = a
    gcd = Integer.gcd(n, d)
    {nn, dd} = {div(n, gcd), div(d, gcd)}
    if dd < 0 do
      {-nn, -dd}
    else
      {nn, dd}
    end
  end
end
