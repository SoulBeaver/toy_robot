defmodule ToyRobot.Commands.PlaceCommand do
  @behaviour ToyRobot.Commands.Command

  @impl ToyRobot.Commands.Command
  def execute(%{x: x, y: y, facing: facing}, {:uninitialized, board, _robot}) do
    {:initialized, board, %ToyRobot.Robot{x: x, y: y, facing: facing}}
  end

  @impl ToyRobot.Commands.Command
  def execute(%{}, {:initialized, _, _} = state) do
    state
  end
end
