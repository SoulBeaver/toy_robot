defmodule ToyRobot.Board do
  @moduledoc """
  Represents the board on which the robot moves in search of its purpose.
  """

  @type t() :: %__MODULE__{
    width: pos_integer(),
    height: pos_integer()
  }

  defstruct width: 5, height: 5

  @doc """
  Creates a new board with validated dimensions

  Examples:

    iex> ToyRobot.Board.new({5, 5})
    {:ok, %ToyRobot.Board{width: 5, height: 5}}

    iex> ToyRobot.Board.new({-1, -1})
    {:error, "width and height must be positive, non-zero integers"}

    iex> ToyRobot.Board.new({0, 5})
    {:error, "width and height must be positive, non-zero integers"}
  """
  @spec new({pos_integer(), pos_integer()}) :: {:ok, t()} | {:error, String.t()}
  def new(dimensions)

  def new({width, height}) when width <= 0 or height <= 0, do: {:error, "width and height must be positive, non-zero integers"}

  def new({width, height}) do
    {:ok, %__MODULE__{width: width, height: height} }
  end

  @doc """
  Creates a new board, raising an error if the dimensions aren't valid

  Examples:

    iex> ToyRobot.Board.new!({5, 5})
    %ToyRobot.Board{width: 5, height: 5}
  """
  @spec new({pos_integer(), pos_integer()}) :: t()
  def new!(dimensions)

  def new!({width, height}) when width <= 0 or height <= 0, do: raise("width and height must be positive, non-zero integers")

  def new!({width, height}) do
    %__MODULE__{width: width, height: height}
  end
end
