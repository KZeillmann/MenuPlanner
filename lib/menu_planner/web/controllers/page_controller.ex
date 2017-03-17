defmodule MenuPlanner.Web.PageController do
  use MenuPlanner.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
