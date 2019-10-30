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
    Monster.attacked(pid, 2)
    :timer.sleep(1)
    Process.flag(:trap_exit, true)

    Monster.attacked(pid, 2)
    :timer.sleep(10)

    assert_receive {:EXIT, _, :death_by_princess}

    Process.flag(:trap_exit, false)
    refute Process.alive?(pid)
  end
end
