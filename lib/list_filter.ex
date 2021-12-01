defmodule ListFilter do
  require Integer

  def call([]), do: 0

  def call(list) do
    list
    |> Enum.filter(fn x -> Integer.parse(x) != :error end)
    |> Enum.map(fn x -> String.to_integer(x) end)
    |> Enum.count(fn x -> Integer.is_odd(x) end)
  end
end
