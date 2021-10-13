defmodule HelloWeb.TagLive do
  use HelloWeb, :live_view

  alias Hello.Meta
  alias Hello.Meta.Tag

  def mount(_params, _session, socket) do
    Meta.subscribe()
    {:ok, fetch(socket)}
  end

  def handle_info({Tag, [:tag | _], _}, socket) do
    {:noreply, fetch(socket)}
  end

  def handle_event("add", %{"tag" => tag}, socket) do
    Meta.create_tag(tag)

    {:noreply, fetch(socket)}
  end

  def handle_event("delete", %{"tag[id]" => id}, socket) do
    Meta.delete_tag(id)

    {:noreply, fetch(socket)}
  end

  def handle_event("delete", what, socket) do
    IO.puts(:stdio, "-------------------------")
    IO.puts(:stdio, what)
    IO.puts(:stdio, "-------------------------")

    {:noreply, fetch(socket)}
  end

  defp fetch(socket) do
    assign(socket, tags: Meta.list_tags())
  end
end
