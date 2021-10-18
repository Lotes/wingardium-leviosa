defmodule BirdCount do
  def today([]), do: nil
  def today([d|_]), do: d

  def increment_day_count([]), do: [1]
  def increment_day_count([d|ds]), do: [d+1|ds]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([d|ds]), do: d == 0 or has_day_without_birds?(ds)

  def total([]), do: 0
  def total([d|ds]), do: d + total(ds)

  def busy_days([]), do: 0
  def busy_days([d|ds]) do
    busy = if d >= 5, do: 1, else: 0
    busy + busy_days(ds)
  end
end
