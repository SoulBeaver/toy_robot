defmodule ToyRobot.Commands.MoveCommand do
  @behaviour ToyRobot.Commands.Command

  alias ToyRobot.{Board, Robot}

  @impl ToyRobot.Commands.Command
  def execute(%{}, {:initialized, %Board{width: _width, height: height}, %Robot{x: _x, y: y, facing: facing}} = state)
    when facing == :north and y == height, do: state

  @impl ToyRobot.Commands.Command
  def execute(%{}, {:initialized, %Board{width: width, height: _height}, %Robot{x: x, y: _y, facing: facing}} = state)
    when facing == :east and x == width, do: state

  @impl ToyRobot.Commands.Command
  def execute(%{}, {:initialized, _board, %Robot{x: _x, y: y, facing: facing}} = state)
    when facing == :south and y == 0, do: state

  @impl ToyRobot.Commands.Command
  def execute(%{}, {:initialized, _board, %Robot{x: x, y: _y, facing: facing}} = state)
    when facing == :west and x == 0, do: state

  @impl ToyRobot.Commands.Command
  def execute(%{}, {:initialized, board, robot}) do
    {:initialized, board, ToyRobot.Robot.move(robot)}
  end

  @impl ToyRobot.Commands.Command
  def execute(%{}, {:uninitialized} = state) do
    IO.puts("Robot has not been initialized yet")
    state
  end
end
