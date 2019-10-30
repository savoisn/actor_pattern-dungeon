defmodule DungeonTest do
  alias Dungeon.Princess
  alias Dungeon.Monster
  alias Dungeon.Hive
  use ExUnit.Case

  test "Princes attacks monster" do
    # Start the
    Hive.start_link([])
    monster = Process.whereis(:monster_hive)
    assert Process.alive?(monster)

    princess = Princess.start_killing_machine()
    assert Process.alive?(princess)
    Princess.attack_with_sword(princess, monster)

    Process.flag(:trap_exit, true)

    Process.link(monster)

    Princess.attack_with_sword(princess, monster)
    :timer.sleep(2)
    assert_receive {:EXIT, _, :death_by_princess}

    Process.unlink(monster)
    Process.flag(:trap_exit, false)

    assert Process.alive?(princess)
    refute Process.alive?(monster)
    monster_new = Process.whereis(:monster_hive)
    refute monster == monster_new
    IO.inspect([monster, monster_new])
    assert Process.alive?(monster_new)
    IO.puts("LET IT CRASH !!!!!")
  end
end
