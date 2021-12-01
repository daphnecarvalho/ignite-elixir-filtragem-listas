defmodule ListFilterIntegersTest do
  use ExUnit.Case

  describe "call/1" do
    test "returns a list of integers that exists on a given list" do
      list = ["1", "3", "6", "43", "banana", "6", "abc"]

      response = ListFilterIntegers.call(list)

      expected_response = [1, 3, 6, 43, 6]

      assert response == expected_response
    end

    test "returns how many odd integers exists on a given list" do
      list = ["1", "3", "6", "43", "banana", "6", "abc"]

      response = ListFilterIntegers.count_odd_elements(list)

      expected_response = 3

      assert response == expected_response
    end

    test "returns how many even integers exists on a given list" do
      list = ["1", "3", "6", "43", "banana", "6", "abc"]

      response = ListFilterIntegers.count_even_elements(list)

      expected_response = 2

      assert response == expected_response
    end
  end
end
