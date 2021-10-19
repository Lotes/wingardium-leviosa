defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim()
    |> String.at(0)
  end

  def initial(name) do
    init = name
    |> first_letter()
    |> String.upcase()
    init <> "."
  end

  def initials(full_name) do
    full_name
    |> String.trim()
    |> String.split()
    |> Enum.map(&initial/1)
    |> Enum.join(" ")
  end

  def pair(full_name1, full_name2) do
    lhs = initials(full_name1)
    rhs = initials(full_name2)
    nl = "\n"
    "     ******       ******" <> nl <>
    "   **      **   **      **" <> nl <>
    " **         ** **         **" <> nl <>
    "**            *            **" <> nl <>
    "**                         **" <> nl <>
    "**     "<>lhs<>"  +  "<>rhs<>"     **" <> nl <>
    " **                       **" <> nl <>
    "   **                   **" <> nl <>
    "     **               **" <> nl <>
    "       **           **" <> nl <>
    "         **       **" <> nl <>
    "           **   **" <> nl <>
    "             ***" <> nl <>
    "              *" <> nl
  end
end
