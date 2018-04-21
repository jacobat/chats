defmodule Chats.CounterServer do
  @moduledoc """
  This counts
  """

  use GenServer

  def start_link(_args) do
    {:ok, pid} = GenServer.start_link(__MODULE__, :ok, [])
    Process.register(pid, :counter_server)
    {:ok, pid}
  end

  def current_value do
    GenServer.call(:counter_server, :current_value)
  end

  def incr do
    GenServer.call(:counter_server, :incr)
  end

  def decr do
    GenServer.call(:counter_server, :decr)
  end

  def init(:ok) do
    {:ok, 0}
  end

  def handle_call(:current_value, _client, state) do
    {:reply, state, state}
  end

  def handle_call(:incr, _client, state) do
    {:reply, state + 1, state + 1}
  end

  def handle_call(:decr, _client, state) do
    {:reply, state - 1, state - 1}
  end
end
