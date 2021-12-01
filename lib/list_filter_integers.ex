defmodule ListFilterIntegers do
  # Dada uma lista de strings que representem números ou não
  # (exemplo ["1", "3", "6", "43", "banana", "6", "abc"]),
  # filtre todos os elementos numéricos da lista e retorne
  # quantos números ímpares existem nessa lista.

  require Integer

  def call(list) do
    list
    |> Enum.filter(fn elem -> (is_integer(elem)) or (is_bitstring(elem) and Integer.parse(elem) != :error) end)
    |> Enum.reduce([], fn elem, new_list -> list_integers(elem, new_list) end)
    |> Enum.reverse
  end

  def count_odd_elements(list) do
    list
    |> ListFilterIntegers.call
    |> Enum.count(fn elem -> Integer.is_odd(elem) end)
  end

  def count_even_elements(list) do
    list
    |> ListFilterIntegers.call
    |> Enum.count(fn elem -> Integer.is_even(elem) end)
  end

  defp list_integers(elem, new_list) do
    [check_type(elem) | new_list]
  end

  defp check_type(elem) when not is_integer(elem) and not is_bitstring(elem), do: nil

  defp check_type(elem) when is_integer(elem), do: elem

  defp check_type(elem) when is_bitstring(elem) do
    if Integer.parse(elem) != :error, do: convert_to_integer(Integer.parse(elem)), else: nil
  end

  defp convert_to_integer({number, _}), do: number
end
