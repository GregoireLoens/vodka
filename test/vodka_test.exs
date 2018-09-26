defmodule VodkaTest do
  use ExUnit.Case
  doctest Vodka

  test "greets the world" do
    assert Vodka.hello() == :world
  end
end
