defmodule Day1 do
  @moduledoc """
  Documentation for `Day1`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Day1.hello()
      :world

  """
  def hello do
    :world
  end

  def elves do
    {:ok, contents} = File.read("input.txt")

    contents
    |> String.split("\n")
    |> Enum.reduce(%{count: 1, elves: %{}},
      fn calories, acc ->
        if calories == "" do
          Map.put(acc, :count, acc.count + 1)
        else
          calories = String.to_integer(calories)
          name = Integer.to_string(acc.count)
          existing_calories = get_in(acc, [:elves, name]) || 0
          put_in(acc, [:elves, name], existing_calories + calories)
        end
      end
    ) |> Map.get(:elves)
      |> Enum.sort_by(fn {_, calories} -> -calories end)
  end

  def part_1 do
    elves = elves()

    {name, count} = hd(elves)

    count
  end

  def part_2 do
    top_elves_calories = elves()
    |> Enum.take(3)
    |> Enum.map(fn {_, calories} -> calories end)
    |> Enum.sum()
  end
end
