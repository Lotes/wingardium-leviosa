defmodule GuessingGame do
  def compare(_secret_number), do: "Make a guess"
  def compare(_secret_number, :no_guess), do: "Make a guess"
  def compare(secret_number, guess)
    when not is_integer(secret_number)
    or not is_integer(guess), do: raise "Invalid input"
  def compare(secret_number, guess)
    when abs(secret_number -  guess) == 1, do: "So close"
  def compare(secret_number, guess)
    when secret_number <  guess, do: "Too high"
  def compare(secret_number, guess)
    when secret_number >  guess, do: "Too low"
  def compare(secret_number, guess)
    when secret_number == guess, do: "Correct"
end
