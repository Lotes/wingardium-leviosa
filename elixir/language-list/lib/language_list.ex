defmodule LanguageList do
  def new(),  do:  []

  def add(list, language)
    when is_list(list)
    and is_bitstring(language) do
    [language|list]
  end

  def remove([a|as]),  do:  as
  def remove([]),  do:  []

  def first([a|_]),  do:  a

  def count([]),  do:  0
  def count([_|as]),  do:  1 + count(as)

  def exciting_list?([]),  do:  false
  def exciting_list?(["Elixir"|_]),  do:  true
  def exciting_list?([_|as]),  do:  exciting_list?(as)
end
