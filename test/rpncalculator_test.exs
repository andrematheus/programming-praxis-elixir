defmodule RpnCalculatorTest do
  use ExUnit.Case
  doctest RpnCalculator

  test "splits list" do
    assert RpnCalculator.split([1,2,3,4,5], 2) == { [1,2], [3,4,5] }
  end

  test "site example works" do
    top = RpnCalculator.evaluate("19 2.14 + 4.5 2 4.3 / - *") |> hd |> Float.round(4)
    assert top == 85.2974
  end
end
