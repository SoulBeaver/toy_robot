defmodule ToyRobot.Commands.Command do
  @type state :: :uninitialized | :initialized
  @type t() :: {state(), Board.t(), Robot.t()}

  @callback execute(any(), t()) :: t()
end
