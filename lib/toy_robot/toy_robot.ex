defmodule ToyRobot.ToyRobot do
  @moduledoc """
  Documentation for `ToyRobot`.
  """
  def execute(commands) do
    commands
    |> Enum.map(&ToyRobot.CommandParser.parse/1)
    |> Enum.each(&ToyRobot.Boundary.World.execute_command/1)

    ToyRobot.Boundary.World.get_world()
  end
end
