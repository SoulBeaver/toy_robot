defmodule ToyRobot.CommandParser do
  @moduledoc """
  Parses commands from a file or command line.
  """
  alias ToyRobot.Commands.{PlaceCommand, MoveCommand, LeftCommand, RightCommand, ReportCommand, TeleportCommand}

  def parse("PLACE " <> args) do
    [x, y, facing] = String.split(args, ",")


    {:place, %{x: 1, y: 1, facing: :north}, &PlaceCommand.execute/2}
  end

  def parse("TELEPORT " <> args) do
    [x, y, facing] = String.split(args, ",")


    {:teleport, %{x: 1, y: 1, facing: :north}, &TeleportCommand.execute/2}
  end

  def parse("MOVE") do
    {:move, %{}, &MoveCommand.execute/2}
  end

  def parse("LEFT") do
    {:left, %{}, &LeftCommand.execute/2}
  end

  def parse("RIGHT") do
    {:right, %{}, &RightCommand.execute/2}
  end

  def parse("REPORT") do
    {:report, %{}, &ReportCommand.execute/2}
  end
end
