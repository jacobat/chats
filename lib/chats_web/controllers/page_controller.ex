defmodule ChatsWeb.PageController do
  use ChatsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
