defmodule DungeonTest do
  use ExUnit.Case
  doctest Dungeon

  test "greets the world" do
    assert Dungeon.hello() == :world
  end
end
