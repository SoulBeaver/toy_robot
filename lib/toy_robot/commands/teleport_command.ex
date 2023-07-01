defmodule ToyRobot.Commands.TeleportCommand do
  @behaviour ToyRobot.Commands.Command

  @impl ToyRobot.Commands.Command
  def execute(%{x: x, y: y, facing: facing}, {:initialized, board, robot}) do
    {:initialized, board, %ToyRobot.Robot{robot | x: x, y: y, facing: facing}}
  end

  def execute(%{}, {:uninitialized, _board, _robot} = state) do
    IO.puts("Robot has not been initialized yet")
    state
  end
end
