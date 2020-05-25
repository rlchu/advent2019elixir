defmodule Advent2019Day1 do
  def get_data do
    {:ok, file} = File.open("./lib/day1data", [:read])
    IO.read(file, :all) 
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
  end

  def fuel_needed(x) do
    Float.floor(x / 3) - 2
  end

  def fuel_with_additional_fuels(mass) do
    #need to start iteration on a call to fuel_needed(mass) first
    Stream.iterate(fuel_needed(mass), &(fuel_needed(&1))) 
    |> Stream.take_while(&(&1 > 0))
    |> Enum.sum()
  end

  def solve(fueling_fn) do
    get_data()
    |> Enum.map( fn x -> fueling_fn.(x) end)
    |> Enum.sum()
  end

  def part_one do
    solve(&Advent2019Day1.fuel_needed/1)
  end

  def part_two do
    solve(&Advent2019Day1.fuel_with_additional_fuels/1)
  end
end

