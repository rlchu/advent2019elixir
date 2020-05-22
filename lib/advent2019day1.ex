defmodule Advent2019Day1 do

  def hello do
    {:ok, file} = File.open("./lib/day1data", [:read])
    IO.read(file, :all) 
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
    |> IO.inspect
  end
end
