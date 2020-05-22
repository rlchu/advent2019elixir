defmodule Advent2019Day1 do
  def fuel_needed(x) do
    Float.floor(x / 3) - 2
  end

  def get_data do
    {:ok, file} = File.open("./lib/day1data", [:read])
    IO.read(file, :all) 
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
  end

  def fuel_with_additional_fuels(mass) do
    Stream.iterate(mass, &(fuel_needed(&1))) 
    |> Stream.take_while(&(&1 > 0))
    |> Enum.sum()
  end

  def part_one do
    get_data()
    |> Enum.map( fn x -> fuel_needed(x) end)
    |> Enum.sum()
  end

  def part_two do
    get_data()
    |> Enum.map( fn x -> fuel_with_additional_fuels(x) end)
    |> Enum.sum()
  end
end

