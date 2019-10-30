defmodule Dungeon.Hive do
  use Supervisor

  def init(_) do
    children = [
      %{
        id: "Monster",
        start: {Dungeon.Monster, :start_link, [3, :monster_hive]}
      }
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  def start_link(_) do
    Supervisor.start_link(__MODULE__, [], name: :hive)
  end

  def dummy do
    :foo
  end
end
