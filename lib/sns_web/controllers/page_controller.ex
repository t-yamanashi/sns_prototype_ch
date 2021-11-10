defmodule SnsWeb.PageController do
  use SnsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
