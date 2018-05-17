defmodule PPTest do
  use ExUnit.Case
  doctest PP

  test "greets the world" do
    assert PP.hello() == :world
  end
end
