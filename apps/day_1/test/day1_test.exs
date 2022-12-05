defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "greets the world" do
    assert Day1.hello() == :world
  end

  test "part_1" do
    assert Day1.part_1() == 70720
  end

  test "part_2" do
    assert Day1.part_2() == 207148
  end
end
