defmodule Dungeon do
  use Application

  def start(_type, _args) do
    children = [
      Dungeon.Hive
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
