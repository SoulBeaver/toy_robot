defmodule ToyRobot.Boundary.World do
  use GenServer

  def start_link(options \\ []) do
    GenServer.start_link(__MODULE__, {:uninitialized, %ToyRobot.Board{width: 5, height: 5}, nil}, options)
  end

  def get_world(manager \\ __MODULE__) do
    GenServer.call(manager, {:get_world})
  end

  def execute_command(manager \\ __MODULE__, {name, command_args, callback_fn}) do
    GenServer.call(manager, {:execute, name, command_args, callback_fn})
  end

  def init(world) do
    {:ok, world}
  end

  def handle_call({:initialize}, _from, world) do
    {:reply, :ok, world}
  end

  def handle_call({:get_world}, _from, world) do
    {:reply, {:ok, world}, world}
  end

  def handle_call({:execute, _name, command_args, callback_fn}, _from, world) do
    {:reply, :ok, callback_fn.(command_args, world)}
  end
end
