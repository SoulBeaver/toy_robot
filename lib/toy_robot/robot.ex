defmodule ToyRobot.Robot do
  @moduledoc """
  A movable robot that roams around searching for the meaning of its existence.
  """

  @type facing :: :north | :south | :east | :west

  @type t() :: %__MODULE__{
    x: pos_integer(),
    y: pos_integer(),
    facing: facing()
  }

  defstruct x: 0,
            y: 0,
            facing: :north

  @doc """
  Move the robot one space

  Examples:

    iex> ToyRobot.Robot.move(%ToyRobot.Robot{x: 0, y: 0, facing: :north})
    %ToyRobot.Robot{x: 0, y: 1, facing: :north}

    iex> ToyRobot.Robot.move(%ToyRobot.Robot{x: 0, y: 0, facing: :east})
    %ToyRobot.Robot{x: 1, y: 0, facing: :east}

    iex> ToyRobot.Robot.move(%ToyRobot.Robot{x: 0, y: 1, facing: :south})
    %ToyRobot.Robot{x: 0, y: 0, facing: :south}

    iex> ToyRobot.Robot.move(%ToyRobot.Robot{x: 1, y: 0, facing: :west})
    %ToyRobot.Robot{x: 0, y: 0, facing: :west}
  """
  @spec move(t()) :: t()
  def move(%__MODULE__{x: x, y: y, facing: facing} = robot) do
    case facing do
      :north -> %__MODULE__{robot | y: y + 1}
      :south -> %__MODULE__{robot | y: y - 1}
      :east  -> %__MODULE__{robot | x: x + 1}
      :west  -> %__MODULE__{robot | x: x - 1}
    end
  end

  @doc """
  Turn the robot left

  Examples:

    iex> ToyRobot.Robot.left(%ToyRobot.Robot{x: 0, y: 0, facing: :north})
    %ToyRobot.Robot{x: 0, y: 0, facing: :west}

    iex> ToyRobot.Robot.left(%ToyRobot.Robot{x: 0, y: 0, facing: :east})
    %ToyRobot.Robot{x: 0, y: 0, facing: :north}

    iex> ToyRobot.Robot.left(%ToyRobot.Robot{x: 0, y: 0, facing: :south})
    %ToyRobot.Robot{x: 0, y: 0, facing: :east}

    iex> ToyRobot.Robot.left(%ToyRobot.Robot{x: 0, y: 0, facing: :west})
    %ToyRobot.Robot{x: 0, y: 0, facing: :south}
  """
  @spec left(t()) :: t()
  def left(%__MODULE__{facing: facing} = robot) do
    case facing do
      :north -> %__MODULE__{robot | facing: :west}
      :south -> %__MODULE__{robot | facing: :east}
      :east  -> %__MODULE__{robot | facing: :north}
      :west  -> %__MODULE__{robot | facing: :south}
    end
  end

  @doc """
  Turn the robot right

  Examples:

    iex> ToyRobot.Robot.right(%ToyRobot.Robot{x: 0, y: 0, facing: :north})
    %ToyRobot.Robot{x: 0, y: 0, facing: :east}

    iex> ToyRobot.Robot.right(%ToyRobot.Robot{x: 0, y: 0, facing: :east})
    %ToyRobot.Robot{x: 0, y: 0, facing: :south}

    iex> ToyRobot.Robot.right(%ToyRobot.Robot{x: 0, y: 0, facing: :south})
    %ToyRobot.Robot{x: 0, y: 0, facing: :west}

    iex> ToyRobot.Robot.right(%ToyRobot.Robot{x: 0, y: 0, facing: :west})
    %ToyRobot.Robot{x: 0, y: 0, facing: :north}
  """
  @spec right(t()) :: t()
  def right(%__MODULE__{facing: facing} = robot) do
    case facing do
      :north -> %__MODULE__{robot | facing: :east}
      :south -> %__MODULE__{robot | facing: :west}
      :east  -> %__MODULE__{robot | facing: :south}
      :west  -> %__MODULE__{robot | facing: :north}
    end
  end
end
