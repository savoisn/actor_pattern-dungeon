defmodule Dungeon.PrincessTest do
  use ExUnit.Case
  # doctest Dungeon.Princess

  setup do
    # do someting to setup test

    on_exit(fn ->
      # do something when test exits
      nil
    end)
  end

  test "dummy test" do
  end
end
