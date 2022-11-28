defmodule ChatWeb.PageController do
  use ChatWeb, :controller
  alias Chat.ChatStore
  def index(conn, _params) do
    messages = ChatStore.list_messages
    render(conn, "index.html", messages: messages)
  end
end
