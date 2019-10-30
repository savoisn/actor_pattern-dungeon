defmodule DungeonTest do
  alias Dungeon.Princess
  alias Dungeon.Monster
  use ExUnit.Case

  test "Princes attacks monster" do
    monster = Monster.start(3)
    assert Process.alive?(monster)
    princess = Princess.start_killing_machine()
    assert Process.alive?(princess)
    Princess.attack_with_sword(princess, monster)

    Process.flag(:trap_exit, true)

    Princess.attack_with_sword(princess, monster)
    :timer.sleep(2)
    assert_receive {:EXIT, _, :death_by_princess}

    Process.flag(:trap_exit, false)

    assert Process.alive?(princess)
    refute Process.alive?(monster)
  end
end
