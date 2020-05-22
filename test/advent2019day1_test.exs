defmodule Advent2019Day1Test do
  use ExUnit.Case
  doctest Advent2019Day1

  test "day1" do
    assert Advent2019Day1.part_one() == 3262991.0
    assert Advent2019Day1.part_two() == 4891620.0
  end
end
