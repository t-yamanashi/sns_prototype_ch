defmodule SnsWeb.ContentLive.Index do
  use SnsWeb, :live_view

  alias Sns.Contents
  alias Sns.Contents.Content

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :contents, list_contents())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Content")
    |> assign(:content, Contents.get_content!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Content")
    |> assign(:content, %Content{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Contents")
    |> assign(:content, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    content = Contents.get_content!(id)
    {:ok, _} = Contents.delete_content(content)

    {:noreply, assign(socket, :contents, list_contents())}
  end

  defp list_contents do
    Contents.list_contents()
  end
end
