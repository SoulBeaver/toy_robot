defmodule ToyRobot.Commands.RightCommand do
  @behaviour ToyRobot.Commands.Command

  @impl ToyRobot.Commands.Command
  def execute(%{}, {:initialized, board, robot}) do
    {:initialized, board, ToyRobot.Robot.right(robot)}
  end

  @impl ToyRobot.Commands.Command
  def execute(%{}, {:uninitialized, _board, _robot} = state) do
    IO.puts("Robot has not been initialized yet")
    state
  end
end
