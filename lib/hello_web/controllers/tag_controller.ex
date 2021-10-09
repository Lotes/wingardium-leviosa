defmodule HelloWeb.TagController do
  use HelloWeb, :controller

  alias Hello.Meta
  alias Hello.Meta.Tag

  action_fallback HelloWeb.FallbackController

  def ui(conn, _params) do
    tags = Meta.list_tags()
    render(conn, "index.html", %{
      tags: tags
    })
  end

  def index(conn, _params) do
    tags = Meta.list_tags()
    render(conn, "index.json", tags: tags)
  end

  def create(conn, %{"name" => name}) do
    with {:ok, %Tag{} = tag} <- Meta.create_tag(%{name: name}) do
      conn
      |> redirect(to: Routes.tag_path(conn, :ui))
      |> render("show.json", tag: tag)
    end
  end

  def show(conn, %{"id" => id}) do
    tag = Meta.get_tag!(id)
    render(conn, "show.json", tag: tag)
  end

  def update(conn, %{"id" => id, "tag" => tag_params}) do
    tag = Meta.get_tag!(id)

    with {:ok, %Tag{} = tag} <- Meta.update_tag(tag, tag_params) do
      render(conn, "show.json", tag: tag)
    end
  end

  def delete(conn, %{"id" => id}) do
    tag = Meta.get_tag!(id)

    with {:ok, %Tag{}} <- Meta.delete_tag(tag) do
      send_resp(conn, :no_content, "")
    end
  end
end
