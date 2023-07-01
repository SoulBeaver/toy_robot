defmodule ToyRobot.Commands.ReportCommand do
  @behaviour ToyRobot.Commands.Command

  @impl ToyRobot.Commands.Command
  def execute(%{}, {:initialized, _board, %ToyRobot.Robot{x: x, y: y, facing: facing}} = state) do
    IO.puts("Robot is at (#{x}, #{y}) facing #{facing}")
    state
  end

  @impl ToyRobot.Commands.Command
  def execute(%{}, {:uninitialized, _board, _robot} = state) do
    IO.puts("Robot is uninitialized")
    state
  end
end
