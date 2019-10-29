defmodule Dungeon.MonsterTest do
  alias Dungeon.Monster
  use ExUnit.Case
  # doctest Dungeon.Monster

  setup do
    # do someting to setup test

    on_exit(fn ->
      # do something when test exits
      nil
    end)
  end

  test "monster grrr test" do
    assert Dungeon.Monster.grrr() == :raaa
  end

  test "monster start" do
    pid = Monster.start(3)
    assert is_pid(pid)
    assert Process.alive?(pid)
    :timer.sleep(1)
    assert Process.alive?(pid)
    send(pid, {:attacked})
    :timer.sleep(1)
    assert !Process.alive?(pid)
  end
end
