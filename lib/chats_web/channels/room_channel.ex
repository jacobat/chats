defmodule ChatsWeb.RoomChannel do
  @moduledoc """
  It's the channel
  """

  alias Chats.CounterServer

  use ChatsWeb, :channel

  def join(channel_name, _params, socket) do
    {:ok, %{channel: channel_name}, socket}
  end

  def handle_in("message:current", %{}, socket) do
    content = CounterServer.current_value()
    push(socket, "room:lobby:new_message", %{content: content})
    {:reply, :ok, socket}
  end

  def handle_in("message:add", %{"message" => content}, socket) do
    case content do
      "incr" ->
        value = CounterServer.incr()
      "decr" ->
        value = CounterServer.decr()
    end

    broadcast!(socket, "room:lobby:new_message", %{content: value})
    {:reply, :ok, socket}
  end
end
