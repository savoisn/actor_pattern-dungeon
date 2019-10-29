defmodule DungeonTest do
  alias Dungeon.Princess
  use ExUnit.Case
  doctest Dungeon

  test "princess should say hi" do
    assert Princess.hi() == :hello
  end
end
