defmodule WingardiumWeb.PageController do
  use WingardiumWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
